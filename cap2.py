#!/usr/bin/python

'''
Problem:
python cap2.py <server1> <server2> <server3> ...

Optimization Area:
    1. Handle multiple Server with different login credentials.
    2. Handle output if host is not reachable.
    3. Connection handling if network fluctuate.
'''

import sys
import pssh.utils
from pssh.pssh_client import ParallelSSHClient
from pssh.exceptions import AuthenticationException, \
    UnknownHostException, ConnectionErrorException
cmd = None

USERNAME = "somesh"
PASSWORD = "somesh"
pssh.utils.enable_host_logger()

client = ParallelSSHClient(sys.argv[1:], user=USERNAME, password=PASSWORD)

while cmd != "exit":
    cmd = raw_input("$>")
    try:
        output = client.run_command(cmd, sudo=True)
        client.join(output, consume_output=True)
    except (AuthenticationException, UnknownHostException,
            ConnectionErrorException):
        pass

del client
