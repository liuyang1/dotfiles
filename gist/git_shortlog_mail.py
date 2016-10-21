"""
Background:

git shortlog -nse

User may use different nick name in git-shortlog, but always use same mail.
This command cannot map user by mail. I have to use complex .mailmap file.

Write this script to summarize commit number by mail instead of by user name.

How to use:

    git shortlog -nse > git_shortlog.list
    python git_shortlog_mail.py

"""
with open("git_shortlog.list") as fp:
    dct = {}
    for l in fp:
        l = l.split()
        k = l[-1]
        v = int(l[0].strip())
        if k in dct:
            dct[k] += v
        else:
            dct[k] = v
    view = [(name, num) for num, name in dct.iteritems()]
    view.sort(reverse=True)
    for i in range(len(view)):
        num, name = view[i]
        print "%d\t%d\t%s" % (i + 1, num, name)
