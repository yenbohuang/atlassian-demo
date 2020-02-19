FROM python:alpine3.11
LABEL "maintainer"="yenbohuang@gmail.com"

EXPOSE 25/tcp

# Need to add '-u' for disable python buffered output
# https://stackoverflow.com/questions/23524976/capturing-output-of-python-script-run-inside-a-docker-container/24183941#24183941
ENTRYPOINT ["python", "-u", "-m", "smtpd", "-n", "-c", "DebuggingServer", "0.0.0.0:25"]
