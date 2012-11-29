#!/usr/bin/python

from __future__ import print_function
import sys
import restclient
import urlparse
import functools
import argparse
import json
import pprint

#def create_repository(name, user, password, url, private=False):
def create_repository(name, auth, url, private=False):
	# bitbucket-api doesn't seem to work!
	#import bitbucket
	
	#bb = bitbucket.Bitbucket(username=user, password=password)
	#res = bb.create_repository(name, scm="hg", private=private)

	
        make_url = functools.partial(urlparse.urljoin, url)

        res = restclient.POST(make_url('repositories/'),
                params=dict(name=name, is_private=private), async=False,
                headers=dict(Authorization=auth), accept=['text/json'],
        )

        res = json.loads(res)
        return res

def create_repository_cmd():
        from getpass import getuser, getpass
        parser = argparse.ArgumentParser()
        parser.add_argument('repo_name')
        parser.add_argument('-u', '--user')
	#parser.add_argument('-p', '--password')
        parser.add_argument('-U', '--url', default='https://api.bitbucket.org/1.0/')
        parser.add_argument('-P', '--private', default=True,
                action="store_true")
        args = parser.parse_args()
        #if not args.user:
        #        args.user = getuser()
	#if not args.password:
	#	args.password = getpass()
	if not args.auth

        res = create_repository(args.repo_name, args.user, args.password, args.url, private = args.private)
        pprint.pprint(res)

if __name__ == '__main__':
        create_repository_cmd()
