#!/usr/bin/python

#Problem: Script which will list out all IAM users and their corresponding IAM roles and IAM role policies given an AWS Account.

import boto3
from collections import defaultdict

client = boto3.client('iam')

users = client.list_users()
user_list=[users['Users'][i]['UserName'] for i in range(len(users['Users']))]

d = defaultdict(list)

for user in user_list:
    attached_policy=client.list_attached_user_policies(UserName=user)
    for num in range(len(attached_policy['AttachedPolicies'])):
        d[attached_policy['AttachedPolicies'][num]['PolicyName']].append(user)

groups = client.list_groups()
group_list=[groups['Groups'][i]['GroupName'] for i in range(len(groups['Groups']))]

for group in group_list:
    attached_policy=client.list_attached_group_policies(GroupName=group)
    for num in range(len(attached_policy['AttachedPolicies'])):
        d[attached_policy['AttachedPolicies'][num]['PolicyName']].append(group)

for result in d.items():
        print result
