#!/usr/bin/python
# -*- coding: utf-8 -*-

from sqlite3 import dbapi2 as db
import os

homedir =  os.environ['HOME']
cookie_file = homedir + '/.config/chromium/Default/Cookies'
output_file = homedir + '/cookies.txt'

conn = db.connect(cookie_file)
cur = conn.cursor()
cur.execute('SELECT host_key, path, secure, expires_utc, name, value FROM cookies')

f = open(output_file, 'w')

for row in cur.fetchall():
    f.write("%s\tTRUE\t%s\t%s\t%d\t%s\t" % (row[0], row[1], str(bool(row[2])).upper(), row[3], row[4]))
    # unicode handler
    f.write(row[5].encode('utf-8'))
    f.write("\n")

f.close()
conn.close()
