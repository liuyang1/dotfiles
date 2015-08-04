#! /usr/bin/env python2
import fileinput


def getLineNo(l):
    suffix = ":"
    idx = l.index(suffix)
    return int(l[0:idx])


def Logger(infile):
    f = fileinput.FileInput(infile)
    for l in f:
        yield l, getLineNo(l)
    f.close()


def mergeLog(ins, out):
    f0, f1 = [Logger(i) for i in ins]
    l1, n1 = next(f1)
    while True:
        # this dynamic iterate, cannot run on FOR, as it bind iterator.
        # this style could dynamic switch between Logger(ins[0), Logger(ins[1])
        try:
            l0, n0 = next(f0)
        except:
            break
        # eat repeat line
        if n0 == n1:
            continue
        # exchange, always output as min lineno l0
        if n0 > n1:
            l0, l1, n0, n1, f0, f1 = l1, l0, n1, n0, f1, f0
        print(l0),
    for l, _ in f1:
        print(l),


if __name__ == "__main__":
    from argparse import RawTextHelpFormatter, ArgumentParser
    desc = "read greped log from file or STDIN, merge them back to STDOUT"
    parser = ArgumentParser(
        description=desc, formatter_class=RawTextHelpFormatter)
    parser.add_argument('inlog', nargs=2, help='input log file, stdin "-"')
    # parser.add_argument('-o', nargs='?', default="-", help='output file')
    args = parser.parse_args()
    mergeLog(args.inlog, "stdout")
