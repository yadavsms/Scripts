import urllib2
import json
import os
import sys
import re
start_date=sys.argv[1]
url = "http://192.168.2.26:9200/pramati/basilic"
def get_filepath(directory):
        file_path = []
        for root, dirs, files in os.walk(directory):
                for file in files:
                        file_path.append(os.path.join(root,file))
        return file_path
array = get_filepath("/mnt/basilic/access_logs")
array.sort()
test = re.compile(start_date, re.IGNORECASE)
files = [f for f in array if test.search(f)]
for file in files:
        print file
        with open(file, 'r') as f:
                for data in f.readlines():
                        req = urllib2.Request(url, data)
                        out = urllib2.urlopen(req)
                       # print out.read()
