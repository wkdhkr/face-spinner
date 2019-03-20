FROM python:3.6.7

LABEL MAINTAINER="Satha Chaojaroenrat (sathachao@gmail)"

WORKDIR /app

COPY face_spinner /app/face_spinner
COPY saved_models /app/saved_models
COPY application.py requirements.txt /app/

RUN set -ex; \
    apt-get update && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

RUN chown -R nobody:nogroup /app

USER nobody:nogroup

EXPOSE 5000

CMD ["python", "application.py"]
