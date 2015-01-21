from __future__ import print_function
import sh
from collections import namedtuple
import os
import itertools
git = sh.git.bake()


NumStat = namedtuple('NumStat', ['insert', 'delete', 'filename'])


def getCommit(commit):
    """get commit message
    --no-pager: stop pager which block stdout
    -n 1: only show one commit
    (not use ^.. style, this will fail when not have prior commit)
    --color=never: not colorful output
    """
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


def getStatLst():
    cmlst = git('rev-list', 'HEAD', '--after=2014-01-01', '--author=liuyang')
    shalst = cmlst.split()
    stlst = []
    for sha in shalst:
        cm = getCommit(sha)
        ret = parseNumStat(cm)
        stlst.extend(ret)
    return stlst


def groupFileExt(numst):
    fn = numst.filename
    ret = os.path.splitext(fn)
    if ret[1] == "":
        return ret[0]
    else:
        return ret[1]


def main():
    stlst = getStatLst()
    a = sum([st.insert for st in stlst])
    b = sum([st.delete for st in stlst])
    print(a, b, a + b)
    stlst = sorted(stlst, key=groupFileExt)
    for ext, g in itertools.groupby(stlst, groupFileExt):
        g = list(g)
        aa = sum([st.insert for st in g])
        bb = sum([st.delete for st in g])
        print(ext, aa, bb, aa + bb)


if __name__ == "__main__":
    main()
