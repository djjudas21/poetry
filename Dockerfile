FROM python:3.8-alpine
LABEL maintainer "Jonathan Gazeley"

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1

# Install deps from apk and poetry
RUN apk --no-cache add --virtual .build-deps gcc musl-dev linux-headers libffi-dev openssl-dev \
  && pip install poetry \
  && apk --no-cache del .build-deps

RUN poetry config virtualenvs.create false
