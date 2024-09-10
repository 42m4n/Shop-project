FROM python:3.12

ENV PATH="/app/scripts:/py/bin:$PATH"

WORKDIR /app

COPY  ./src/requirments /requirments

RUN pip install -r /requirments/development.txt

COPY ./src .

EXPOSE 8000

RUN chmod -R 755 ./scripts && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \
    adduser --disabled-password --no-create-home djshop && \
    chown -R djshop:djshop /vol && \
    chmod -R 755 /vol
    
USER djshop

CMD ["run.sh"]
