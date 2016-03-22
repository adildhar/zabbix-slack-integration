#!/bin/sh

trigger_name=$1
trigger_status=$2
trigger_severity=$3
hostname=$4
item_name=$5
item_values=$6
trigger_url=$7
project_name=$8

if [ "$trigger_url" == " " ]; then
        $trigger_url='NONE'

elif [ "$item_name" == " " ]; then
        $item_name='UNAVAILABE'

elif [ "$item_value" == " " ]; then
        $item_value='UNAVAILABE'

fi

if [ "$trigger_status" == "PROBLEM" ] && [ "$trigger_severity" == "Disaster" ]; then
        bem_severity=CRITICAL && bem_priority=CRITICAL
elif [ "$trigger_status" == "PROBLEM" ] && [ "$trigger_severity" == "High" ]; then
        bem_severity=MAJOR && bem_priority=HIGH
elif [ "$trigger_status" == "PROBLEM" ] && [ "$trigger_severity" == "Average" ]; then
        bem_severity=MINOR && bem_priority=MEDIUM
elif [ "$trigger_status" == "PROBLEM" ] && [ "$trigger_severity" == "Warning" ]; then
        bem_severity=MINOR && bem_priority=LOW

elif [ "$trigger_status" == "OK" ]; then
        bem_severity=OK

fi

# Slack channel url
url='https://hooks.slack.com/services/xxxxxxxx/xxxxxxx/xxxxxxxxxx'

# username used for slack alert
username='zabbix-monitoring'

# Get the Slack channel or user ($1) and Zabbix subject ($2 - hopefully either PROBLEM or RECOVERY)
to="#recipent-channel"
subject="$bem_severity - $bem_priority: $project_name "
message="${subject}: $trigger_name"

# use desired icon image for icon_emoji, configure for slack user zabbix-monitoring

payload="payload={\"channel\": \"${to}\", \"username\": \"${username}\", \"text\": \"${message}\", \"icon_emoji\": \"${emoji}\"}"
curl -m 5 --data-urlencode "${payload}" $url