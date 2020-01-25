FROM python:3.8.1-alpine3.11
WORKDIR /usr/src/app
RUN apk add --update --no-cache gcc musl-dev libffi-dev
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN devpi-init --root-passwd root
ENTRYPOINT /usr/local/bin/devpi-server --port 8080 --host 0.0.0.0