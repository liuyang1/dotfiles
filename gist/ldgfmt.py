#! /usr/bin/env python3
#-*- encoding:utf-8 -*-
gWidth = 18


def log(*args, **kwargs):
        print(*args, file=sys.stderr, **kwargs)


def isascii(c):
    return ord(c) < 128


def isComment(line):
    return line.startswith(';')


def isBlank(line):
    return line == ''


def isText(line):
    return line.startswith(' ')


def isTitle(line):
    return True


def Nothing(line):
    return line


def fmtText(line):
    """
    >>> fmtText("    abc:def     $1.00")
    '    abc:def             $1.00'
    >>> fmtText("    abc:longlongdef     $1.00")
    '    abc:longlongdef     $1.00'
    >>> fmtText("    汉语：长chang度测试   ￥1.00")
    '    汉语:长chang度测试  $1.00'
    >>> fmtText("    abc:def    abc def ghi")
    '    abc:def             abc def ghi'
    >>> fmtText("    汉语：长chang度测试chang   ￥1.00")
    '    汉语:长chang度测试chang  $1.00'
    >>> fmtText("    abc:def whitespace     $1.00")
    '    abc:def whitespace       $1.00'
    """
    origin = line
    line = line.replace("：", ":")
    line = line.replace("￥", "$")
    lst = line.split()
    if len(lst) == 1:
        ret = "    %s" % (lst[0])
    elif len(lst) >= 2:
        lst[0] = lst[0].strip()
        lst[1] = "$" + lst[1]
        if len(lst) > 2:
            lst[1] = ' '.join(lst[1:])
        offset = sum([0 if isascii(i) else 1 for i in origin])
        width = gWidth - offset
        fmt = "    %%-%ds  %%s" % (width)
        ret = fmt % (lst[0], lst[1])
    else:
        log("todo: not handle when text=%s" % (origin))
        ret = ""
    return ret


def fmtTitle(line):
    """
    >>> fmtTitle("a/b/c   abc")
    'a/b/c  abc'
    >>> fmtTitle("a/b/c   abc   def")
    'a/b/c  abc def'
    """
    lst = line.split()
    if len(lst) >= 2:
        lst[1] = ' '.join(lst[1:])
        ret = "%s  %s" % (lst[0], lst[1])
    else:
        ret = lst[0]
    return ret

actMap = [(isComment, Nothing), (isBlank, Nothing), (isText, fmtText), (isTitle, fmtTitle)
          ]


def engine(fp):
    ret = []
    for line in fp:
        for cond, act in actMap:
            line = line.rstrip()
            if cond(line):
                r = act(line)
                ret.append(r)
                break
    return '\n'.join(ret)


def main(fn):
    with open(fn, "r") as fp:
        data = engine(fp)
    with open(fn, "w") as fp:
        fp.write(data)
        # print(data)


if __name__ == "__main__":
    import sys
    main(sys.argv[1])
