FROM python:3.9-slim

ADD pyproject.toml poetry.lock /app/

WORKDIR /app

ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN pip3 install poetry

RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

ADD /poetry_demo /app/poetry_demo

RUN cd /app; poetry run my-script

CMD cd /app; poetry run my-script
