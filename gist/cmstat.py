#! /usr/bin/env python3
from __future__ import print_function
import sh
from collections import namedtuple
import os
import itertools


NumStat = namedtuple('NumStat', ['insert', 'delete', 'filename'])


def getCommit(cwd, commit):
    """get commit message
    --no-pager: stop pager which block stdout
    -n 1: only show one commit
    (not use ^.. style, this will fail when not have prior commit)
    --color=never: not colorful output
    """
    git = sh.git.bake(_cwd=cwd)
    opt = ('--numstat', '-n 1', '--color=never', '--pretty=%H')
    return git('--no-pager', 'log', commit, *opt)


def parseNumStat(cm):
    l = cm.split('\n\n')
    ret = []
    if len(l) < 2:
        return ret
    for line in l[1].split('\n'):
        line = line.split()
        if len(line) < 3:
            continue
        if line[0] == '-' or line[1] == '-':
            continue
        n = NumStat(int(line[0]), int(line[1]), line[2])
        ret.append(n)
    return ret


def getStatLst(cwd):
    git = sh.git.bake(_cwd=cwd)
    cmlst = git('rev-list', 'HEAD', '--after=2014-12-31', '--author=liuyang')
    shalst = cmlst.split()
    stlst = []
    for sha in shalst:
        cm = getCommit(cwd, sha)
        ret = parseNumStat(cm)
        stlst.extend(ret)
    return stlst


def groupFileExt(numst):
    fn = numst.filename
    ret = os.path.splitext(fn)
    if ret[1] == "":
        return os.path.split(ret[0])[1]
    else:
        return ret[1]


def statRepo(cwd):
    stlst = getStatLst(cwd)
    a = sum([st.insert for st in stlst])
    b = sum([st.delete for st in stlst])
    stlst = sorted(stlst, key=groupFileExt)
    olst = []
    for ext, g in itertools.groupby(stlst, groupFileExt):
        g = list(g)
        aa = sum([st.insert for st in g])
        bb = sum([st.delete for st in g])
        olst.append((ext, aa, bb, aa + bb))
    olst.append(("", a, b, a + b))
    l = max([len(i[0]) for i in olst])
    # print("%s %s %s %s" % ("type".ljust(l), '+'.rjust(4), '-'.rjust(4),
                           # '+/-'.rjust(4)))
    for i in olst:
        print("%s %4d %4d %4d" % (i[0].ljust(l), i[1], i[2], i[3]))
    return olst[-1][1:]


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(
        description='git stat accumulate from specific date')
    parser.add_argument('dirs', type=str, nargs='*',
                        help="repo dirs, default to current dir")
    args = parser.parse_args()
    dirs = args.dirs
    if len(dirs) == 0:
        statRepo(os.getcwd())
    if len(dirs) == 1:
        statRepo(dirs[0])
    else:
        ret = []
        for d in dirs:
            print(d)
            ret.append(statRepo(d))
        cum = map(sum, zip(* ret))
        print("all", end=" ")
        for i in cum:
            print(i, end=" ")
        print("")
