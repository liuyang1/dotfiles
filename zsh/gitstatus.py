#! /usr/ibn/env python2
# -*- encoding=utf-8 -*-
from __future__ import print_function
import sys
from subprocess import Popen, PIPE


def getGitStat():
    gitstat = Popen(
        ['git', 'status', '--short', '--branch'], stdout=PIPE, stderr=PIPE)
    stat, error = gitstat.communicate()

    error_string = error.decode('utf-8')
    if 'fatal: Not a git repository' in error_string:
        sys.exit(0)
    return stat


def getGitHead():
    githead = Popen(
        ['git', 'rev-parse', '--short', 'HEAD'], stdout=PIPE, stderr=PIPE)
    commit = githead.communicate()
    ret = commit[0].strip()
    return ret


def probeBranch(s):
    """
    >>> probeBranch('## 7094...c [ahead 1]')
    ('7094', 'c', 1, 0)
    >>> probeBranch('## HEAD (no branch)')
    ('HEAD', '', 0, 0)
    >>> probeBranch('## 7094...c [ahead 1, behind 1]')
    ('7094', 'c', 1, 1)
    """
    br, rmt, head, behind = "", "", 0, 0
    s = s[3:]
    initialHead = "Initial commit on "
    if s.startswith(initialHead):
        br = "Init"
        return br, rmt, head, behind
    arr = s.split("...")
    br = arr[0]
    # remove () content
    idx = br.find(" (")
    if idx != -1:
        br = br[0:idx]
        if br == 'HEAD':
            br = getGitHead()
    try:
        rmt = arr[1]
    except IndexError:
        return br, rmt, head, behind
    rmt = rmt.split()[0]

    def getNumber(s, prefix, suffix):
        head = s.find(prefix)
        if head is -1:
            return 0
        head += len(prefix)
        tail = s.find(suffix, head)
        if tail is -1:
            return 0
        sub = s[head:tail]
        try:
            return int(sub)
        except ValueError:
            return 0

    head = getNumber(s, "[ahead ", "]")
    if head == 0:
        head = getNumber(s, "[ahead ", ",")
    behind = getNumber(s, "behind ", "]")
    return br, rmt, head, behind


def probeLines(lines):
    Untrack, uModify, uDelete = 0, 0, 0
    Modify, Add, Delete = 0, 0, 0
    for line in lines:
        if line is "":
            continue
        X, Y = line[0], line[1]
        if X is '!':
            continue
        Untrack += X is '?'
        if X is " " or X is "M":
            uModify += Y is 'M'
            uDelete += Y is 'D'
        Modify += X is 'M'
        Add += X is 'A'
        Delete += X is 'D'
    return (Modify, Add, Delete), (uModify, uDelete, Untrack)


class RepoSt:
    clean, unsync, stage, dirty = range(4)


def NotZero(v, sym=""):
    return sym + str(v) if v is not 0 else ""


class Symb():
    branch = ""
    remote = "☁"
    forward = "⌃"
    backward = "⌄"
    modify = "±"
    add = "✔"
    delt = "✘"
    uModify = modify
    uDelete = "✖"
    Untrack = "✚"
    delimiter = "•"


def fmtBranch(brRet):
    br, rmt, head, behind = brRet
    s = Symb.branch + br
    if rmt != "origin/master" and rmt is not "":
        idx = rmt.rfind("/")
        if idx != -1:
            rmt = rmt[idx + 1:]
        s += Symb.remote + rmt
    s += NotZero(head, Symb.forward)
    s += NotZero(behind, Symb.backward)
    status = RepoSt.unsync if head != 0 or behind != 0 else RepoSt.clean
    return s, status


def fmtStage(num):
    s = ""
    Modify, Add, Delete = num
    symbol = [Symb.modify, Symb.add, Symb.delt]
    status = RepoSt.stage if sum(num) is not 0 else RepoSt.clean
    for v, sym in zip(num, symbol):
        s += NotZero(v, sym)
    return s, status


def fmtDirty(num):
    s = ""
    uModify, uDelete, Untrack = num
    symbol = [Symb.uModify, Symb.uDelete, Symb.Untrack]
    # get status skip untrack
    status = RepoSt.dirty if sum(num[0:2]) is not 0 else RepoSt.clean
    for v, sym in zip(num, symbol):
        s += NotZero(v, sym)
    return s, status


def combSeg(br, stage, dirty):
    arr = (fmtBranch(br), fmtStage(stage), fmtDirty(dirty))
    seg, st = zip(*arr)

    def NotNull(v, sym=""):
        return sym + str(v) if v != "" else ""
    s = seg[0]
    if seg[1] != "" or seg[2] != "":
        s += Symb.delimiter + seg[1]
        s += Symb.delimiter + seg[2]
    return s, max(st)


def main():
    stat = getGitStat()
    lines = stat.split('\n')
    br = probeBranch(lines[0])
    stage, dirty = probeLines(lines[1:])
    ret = combSeg(br, stage, dirty)
    for i in ret:
        print(i)


if __name__ == "__main__":
    main()
