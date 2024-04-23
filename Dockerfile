FROM python:3.9-alpine

WORKDIR /app

RUN apk update && \
    apk add --no-cache gcc python3-dev musl-dev linux-headers

COPY . /app/
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers accelerate

CMD ["python3", "app.py"]
