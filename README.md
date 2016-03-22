# zabbix-slack-integration
Configure Slack for Zabbix alertings

`````
On Zabbix dashboard, Configuration -> Action -> Triggers
```
####Create trigger with Actiion and Conditions and set Operations to  Run remote commands on hosts
`````````
path/slack.sh '{TRIGGER.NAME}' '{TRIGGER.STATUS}' '{TRIGGER.SEVERITY}' '{HOST.NAME1}' '{ITEM.NAME1}' '{ITEM.VALUE1}' '{TRIGGER.URL}'  'environment-name'
`````````````
