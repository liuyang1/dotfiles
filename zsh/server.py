import SocketServer
import gitstatus


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
    method, d = cmd[0], cmd[1]
    method = method.lower()
    if method == 'get':
        return gCache.get(d)
    elif method == 'up':
        return gCache.update(d)
    else:
        raise "unkown " + method


class GitStatusHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        self.data = self.request.recv(4906).strip()
        print self.data
        r = rpc(self.data)
        print r
        self.request.sendall(r)


if __name__ == "__main__":
    addr = ("localhost", 7211)
    server = SocketServer.TCPServer(addr, GitStatusHandler)
    server.serve_forever()
