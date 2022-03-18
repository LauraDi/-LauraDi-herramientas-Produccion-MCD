FROM ubuntu

LABEL Diana Laura Ballesteros Valenzuela

WORKDIR /root

RUN  apt-get -y update && \
    apt-get install -yq curl unzip git pip python3.6 python3-pip

RUN pip install csvkit

RUN  curl -L -O https://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/historicos/2022/01/datos_abiertos_covid19_04.01.2022.zip &&\
    unzip datos_abiertos_covid19_04.01.2022 &&\
    csvcut -c FECHA_INGRESO,EDAD 220104COVID19MEXICO.csv > DatosCovid.csv &&\
    rm datos_abiertos_covid19_04.01.2022.zip &&\
    rm 220104COVID19MEXICO.csv

RUN pip install csvkit pandas matplotlib numpy

CMD ["bash"]
