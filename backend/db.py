# -*- coding: utf-8 -*-
import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

def data_base():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        port=os.getenv("DB_PORT")
    )
