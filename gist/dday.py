from datetime import datetime

if __name__ == "__main__":
    import sys
    d1, d2 = sys.argv[1], sys.argv[2]
    d1 = datetime.strptime(d1, "%Y%m%d")
    d2 = datetime.strptime(d2, "%Y%m%d")
    diff = abs((d2 - d1).days)
    print "from ", datetime.strftime(d1, "%Y-%m-%d")
    print "to   ", datetime.strftime(d2, "%Y-%m-%d")
    print "days ", diff
