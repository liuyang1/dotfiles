import SocketServer
import cPickle as pickle
import os
import signal

import gitstatus
import serverlog

log = serverlog.inst()
cacheName = os.path.expanduser('~/.fast-agnoster.cache')


class cache():

    def __init__(self, cacheFile=cacheName):
        # getCall upCall
        self.stat = [0, 0]
        self.fn = cacheFile
        if os.path.exists(self.fn):
            self.load()
        else:
            self.dct = {}

# internal method
    def load(self):
        self.dct = pickle.load(open(self.fn, "rb"))
        log.debug('load data from ' + self.fn)
        log.debug('%s' % (self.dump()))

    def serial(self):
        log.debug("serial to " + self.fn)
        pickle.dump(self.dct, open(self.fn, "wb"))

# external interface
    def quit(self):
        self.serial()

    def update(self, k):
        self.stat[1] += 1
        r = gitstatus.main(k)
        log.info("up [%s] [%s]" % (k, r))
        self.dct[k] = r
        return r

    def get(self, k):
        self.stat[0] += 1
        try:
            return self.dct[k]
        except KeyError:
            return self.update(k)

    def dump(self):
        s = ""
        for k, v in self.dct.iteritems():
            s += "%s %s\n" % (k, v)
        s += "get %d up %d\n" % (self.stat[0], self.stat[1])
        return s

gCache = cache()


def Stophdl(signal, frame):
    log.info("signal handler dump data")
    gCache.dump()
    gCache.quit()


def rpc(cmd):
    cmd = cmd.split()
    method = cmd[0]
    method = method.lower()
    if method == "dump":
        return gCache.dump()
    try:
        d = cmd[1]
    except IndexError:
        log.warn("method [%s] need param" % (method))
        return ""
    if method == 'get':
        return gCache.get(d)
    if method == 'up':
        return gCache.update(d)
    log.warn("unknown method %s" % (method))


class GitStatusHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        self.data = self.request.recv(4906).strip()
        log.debug("rpc [%s]" % (self.data))
        r = rpc(self.data)
        log.debug("ret [%s]" % (r))
        self.request.sendall(r)


if __name__ == "__main__":
    signal.signal(signal.SIGINT, Stophdl)
    signal.signal(signal.SIGTERM, Stophdl)
    signal.signal(signal.SIGHUP, Stophdl)
    addr = ("localhost", 7211)
    server = SocketServer.TCPServer(addr, GitStatusHandler)
    log.info("register signal, start service")
    server.serve_forever()
