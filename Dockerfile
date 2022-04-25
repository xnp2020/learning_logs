# syntax=docker/dockerfile:1

FROM python:3.10.4-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -i https://pypi.doubanio.com/simple  --trusted-host pypi.doubanio.com -r requirements.txt

COPY . .

RUN python3 manage.py migrate

CMD [ "python3", "manage.py" , "runserver", "0.0.0.0:8000"]