import logging

log_file = "/tmp/fast-agnoster.log"
log_level = logging.DEBUG

logger = logging.getLogger("logging.NormalLogger")

handler = logging.FileHandler(log_file)
formatter = logging.Formatter("[%(asctime)s] [%(levelname)s] %(message)s")
handler.setFormatter(formatter)
logger.addHandler(handler)

logger.setLevel(log_level)


def inst():
    return logger


def shutdown():
    logging.shutdown()
