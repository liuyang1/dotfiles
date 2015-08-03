#! /usr/bin/env python2
import fileinput


def getLineNo(l):
    suffix = ":"
    idx = l.index(suffix)
    return int(l[0:idx])


def mergeLog(ins, out):
    # f0 = open(ins[0])
    # f1 = open(ins[1])
    f0 = fileinput.input(ins[0])
    f1 = fileinput.input(ins[1])
    l0 = f0.readline()
    l1 = f1.readline()
    n0 = getLineNo(l0)
    n1 = getLineNo(l1)
    notend = True
    while notend:
        while n1 == 0 or n0 < n1:
            print(l0.strip())
            l0 = f0.readline()
            if l0 == "":
                n0 = 0
                break
            n0 = getLineNo(l0)
        if n0 == 0 and n1 == 0:
            break
        while n0 == n1:
            print(l0.strip())
            l0 = f0.readline()
            n0 = getLineNo(l0)
            l1 = f1.readline()
            n1 = getLineNo(l1)
        if n0 == 0 and n1 == 0:
            break
        while n0 == 0 or n0 > n1:
            print(l1.strip())
            l1 = f1.readline()
            if l1 == "":
                n1 = 0
                break
            n1 = getLineNo(l1)
        if n0 == 0 and n1 == 0:
            break
    f0.close()
    f1.close()


if __name__ == "__main__":
    from argparse import RawTextHelpFormatter, ArgumentParser
    desc = """read greped log from file or STDIN, merge them back to STDOUT"""
    parser = ArgumentParser(
        description=desc, formatter_class=RawTextHelpFormatter)
    parser.add_argument('inlog', nargs=2, help='input log file, stdin "-"')
    # parser.add_argument('-o', nargs='?', default="-", help='output file')
    args = parser.parse_args()
    mergeLog(args.inlog, "stdout")
