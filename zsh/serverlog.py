import logging

log_file = "/tmp/fast-agnoster.log"
log_level = logging.DEBUG

logger = logging.getLogger("logging.NormalLogger")

handler = logging.FileHandler(log_file)
fmt = "[%(asctime)s] [%(filename)s:%(lienno)s] [%(levelname)s] %(message)s"
formatter = logging.Formatter(fmt)
handler.setFormatter(formatter)
logger.addHandler(handler)

logger.setLevel(log_level)


def inst():
    return logger


def shutdown():
    logging.shutdown()
