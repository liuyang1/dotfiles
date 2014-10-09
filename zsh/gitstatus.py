#! /usr/ibn/env python2
from __future__ import print_function
import sys


def getGitStat():
    from subprocess import Popen, PIPE

    gitstat = Popen(
        ['git', 'status', '--short', '--branch'], stdout=PIPE, stderr=PIPE)
    stat, error = gitstat.communicate()

    error_string = error.decode('utf-8')
    if 'fatal: Not a git repository' in error_string:
        sys.exit(0)
    return stat


def probeBranch(s):
    s = s[3:]
    initialHead = "Initial commit on "
    if s.startswith(initialHead):
        return s[len(initialHead):], None
    br = s.split("...")
    if len(br) == 1:
        br.append("")
    return br


def probeLines(lines):
    Untrack, uModify, uDelete = 0, 0, 0
    Modify, Add, Delete, Rename, Copied = 0, 0, 0, 0, 0
    mlDelete, mrDelete, mlAdd, mrAdd, mlModify, mrMofidy = 0, 0, 0, 0, 0, 0
    for line in lines:
        if line is "":
            continue
        X, Y = line[0], line[1]
        if X is "?":
            Untrack += 1
        elif X is "!":
            continue
        elif X is "D" and Y is "D":
            mlDelete += 1
            mrDelete += 1
        elif X is "A" and Y is "U":
            mlAdd += 1
        elif X is "U" and Y is "D":
            mrDelete += 1
        elif X is "U" and Y is "A":
            mrAdd += 1
        elif X is "D" and Y is "U":
            mlDelete += 1
        elif X is "A" and Y is "A":
            mlAdd += 1
            mrAdd += 1
        elif X is "U" and Y is "U":
            mlModify += 1
            mrMofidy += 1
        if X is " " or X is "M":
            if Y is "M":
                uModify += 1
            elif Y is "D":
                uDelete += 1
        if X is "M":
            Modify += 1
        elif X is "A":
            Add += 1
        elif X is "D":
            Delete += 1
        elif X is "R":
            Rename += 1
        elif X is "C":
            Copied += 1
    return Untrack, uModify, uDelete, Modify, Add, Delete, Rename, Copied


if __name__ == "__main__":
    stat = getGitStat()
    lines = stat.split('\n')
    br = probeBranch(lines[0])
    for i in br:
        print(i)
    num = probeLines(lines[1:])
    for i in num:
        print(i)
