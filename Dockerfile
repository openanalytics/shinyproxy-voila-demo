FROM python:3.10

LABEL maintainer "Tobias Verbeke <tobias.verbeke@openanalytics.eu>"

RUN pip3 install ipywidgets ipykernel voila pandas

WORKDIR /app

EXPOSE 8080

COPY ./basics.ipynb .

CMD ["voila", "basics.ipynb", "--no-browser", "--port=8080", "--Voila.ip=0.0.0.0"]
