FROM python:3.12



COPY  ./requirments /requirments
COPY ./scripts /scripts
COPY ./src /src



WORKDIR /app

EXPOSE 8000

RUN /py/bin/pip install -r /requirments/development.txt



RUN chmod -R 755 scripts && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \
    adduser --disabled-password --no-create-home djshop && \
    chown -R djshop:djshop /vol && \
    chmod -R 755 /vol
    





ENV PATH="/scripts:/py/bin:$PATH"

USER djshop

CMD ["run.sh"]