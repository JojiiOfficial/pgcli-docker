# syntax = docker/dockerfile:experimental
FROM python:slim-bookworm
RUN apt-get -y update && apt-get -y install libpq-dev build-essential less
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*
RUN --mount=type=cache,target=/root/.cache/pip pip install pgcli -U
# RUN pip install pgcli -U
# RUN pip install pgspecial
ADD run-pgcli.sh /bin/run-pgcli.sh
ENV PAGER=less
ENTRYPOINT ["run-pgcli.sh"]
