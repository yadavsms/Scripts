#!/bin/bash
#Purpose : To Create/Reset Cassendra Database
. $HOME/.bashrc
action=$1
case $action in
	create)$CASSANDRA_HOME/bin/cqlsh -e "CREATE KEYSPACE IF NOT EXISTS hydra_events WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1};"
	       $CASSANDRA_HOME/bin/cqlsh -e "CREATE TABLE IF NOT EXISTS hydra_events.event_store(app_id text, event_type text, base_ts timestamp, event_id text, event_ts timestamp, keys set<text>, dimensions map<text, text>, measures map<text, double>, stargate text, PRIMARY KEY((app_id, event_type, base_ts, event_id)));"
	     ;;
	reset) $CASSANDRA_HOME/bin/cqlsh -e "DROP KEYSPACE hydra_events ;"
	     ;;
	*) 
	  echo "Usage:- ./`basename ${0}` {create/reset}"
esac
