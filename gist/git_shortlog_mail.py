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

    nums, names = zip(*view)
    import pylab
    import matplotlib.pyplot as pl
    pl.style.use('ggplot')
    fig = pl.figure()
    ax = fig.add_subplot(111)
    ax.plot(nums)
    for i in range(len(names)):
        n = names[i]
        if 'ly@' in n:
            xy = (i, nums[i])
            ax.annotate("ly %d, %d" % (xy[0], xy[1]), xy)
    pylab.savefig('1.png')
