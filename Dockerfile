FROM ubuntu:24.04

COPY main.py main.py
COPY requirements.txt requirements.txt

RUN apt update && apt install -y git python3 pip

RUN git clone https://github.com/dashpay/dash.git && cd dash && git remote add bitcoin https://github.com/bitcoin/bitcoin && git fetch --all

RUN pip install -r requirements.txt

CMD python3 main.py