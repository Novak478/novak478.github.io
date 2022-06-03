import logging
import os

import boto3
import jsonpickle

logger = logging.getLogger()
logger.setLevel(logging.INFO)

client = boto3.client("lambda")
client.get_account_settings()


def lambda_handler(event, context):
    logger.info("## ENVIRONMENT VARIABLES\r" + jsonpickle.encode(dict(**os.environ)))
    logger.info("## EVENT\r" + jsonpickle.encode(event))
    logger.info("## CONTEXT\r" + jsonpickle.encode(context))
    response = client.get_account_settings()
    return response["AccountUsage"]
