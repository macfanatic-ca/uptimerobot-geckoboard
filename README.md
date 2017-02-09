# UptimeRobot to Geckoboard

## Requirements
* Install [jq](https://stedolan.github.io/jq/), a lightweight and flexible command-line JSON processor.
* An active [UptimeRobot](https://uptimerobot.com) Account
* An active [Geckoboard](https://www.geckoboard.com) Account

## API Keys
### Contents
```
# UptimeRobot API Key
UP_API_KEY=1234567890QWERTY
# Geckoboard API Key
GB_API_KEY=1234567890QWERTY
```
### Protecting (Recommended)
```
chown root:root /root/etc/api_keys
chmod 600 /root/etc/api_keys
```

## Variables
```
# From UptimeRobot: The Friendly Name specified within a Monitor (eg. using %20 for spaces)
SERVER_NAME="example%20server"

# From Geckoboard: The Widget Key presented after creating a Monitoring widget
WIDGET_KEY="abc-123-abc-123-abc-123-abc-123"
```

## Crontab
```
# Runs every minute
* * * * * /root/bin/geckobard/server-example.sh
```
