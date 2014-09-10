#!/usr/bin/python

import bitbucket

bb = bitbucket.BitBucket(username='pabryan', password='Youg2Ltc')
bb.create_repository(repo_name, scm='git', private=True)

repo = bb.repository('your-username', 'your-private-repo')
