import SocketServer
import gitstatus
import serverlog

log = serverlog.inst()


class cache():

    def __init__(self):
        self.dct = dict()

    def update(self, k):
        r = gitstatus.main(k)
        self.dct[k] = r
        return r

    def get(self, k):
        try:
            return self.dct[k]
        except KeyError:
            return self.update(k)

gCache = cache()


def rpc(cmd):
    cmd = cmd.split()
    try:
        method, d = cmd[0], cmd[1]
    except:
        log.warn("unknown %s" % (cmd))
        return ""
    method = method.lower()
    if method == 'get':
        return gCache.get(d)
    elif method == 'up':
        return gCache.update(d)
    else:
        log.warn("unknown method %s" % (method))


class GitStatusHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        self.data = self.request.recv(4906).strip()
        log.debug("rpc [%s]" % (self.data))
        r = rpc(self.data)
        log.debug("ret [%s]" % (r))
        self.request.sendall(r)


if __name__ == "__main__":
    addr = ("localhost", 7211)
    server = SocketServer.TCPServer(addr, GitStatusHandler)
    server.serve_forever()
