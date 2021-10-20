FROM  ibmjava as build

RUN apt update

RUN apt -y upgrade

RUN apt -y install git

RUN apt -y install maven

RUN git init

RUN git clone https://RT715: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@github.com/letsopenco/Open-API-tests.git

RUN git pull https://RT715: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@github@github.com/letsopenco/Open-API-tests.git

RUN cp Open-API-tests/settings.xml /etc/maven2

RUN cp Open-API-tests/settings.xml /etc/maven

RUN cp Open-API-tests/settings.xml /.m2

WORKDIR /Open-API-tests

CMD ["mvn", "clean", "-DsuiteXmlFile=src/test/resources/SmokeTest.xml", "-Ddomain=loc", "-DfullLogs=false", "test"]
