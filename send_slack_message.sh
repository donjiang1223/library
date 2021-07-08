#/bin/bash

sendSlackMessage()
{
    [ -z "$1" ] && {
        echo "Message is empty."
        exit
    }

    DATETIME_STR=$(TZ=$CONFIG_TIMEZONE date +"%Y-%m-%d %H:%M:%S")

    # if environment not setting, then print to standard output.
    [ -z "${SLACK_WEBHOOK_URL}" -o -z "${SLACK_CHANNEL}" -o -z "${SLACK_USERNAME}" ] && {
        echo "[${DATETIME_STR}] ${1}"
    } || {
        [ -z "${SLACK_EMOJI}" ] && {
            CONFIG_SLACK_EMOJI=:ghost:
        }

        curl -s -X POST --data-urlencode "payload={\"channel\": \"${SLACK_CHANNEL}\", \"username\": \"${SLACK_USERNAME}\", \"text\": \"[${DATETIME_STR}] ${1}\", \"icon_emoji\": \"${SLACK_EMOJI}\"}" ${SLACK_WEBHOOK_URL} > /dev/null 2>&1 &
    }
}