FROM ubuntu:22.04
# Using newer version of ubuntu to allow python3

MAINTAINER Jay Maliye "jaymaliye@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev
# Using python3 instead of python


# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

EXPOSE 1238
# Using server with port 1238

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]

