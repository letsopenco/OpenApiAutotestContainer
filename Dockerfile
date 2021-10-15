FROM  ibmjava as build

RUN apt update

RUN apt -y upgrade

RUN apt -y install git

RUN apt -y install maven

RUN git init

RUN git clone https://user_name:personal_access_token@github.com/letsopenco/Open-API-tests.git

RUN git pull https://user_name:personal_access_token@github.com/letsopenco/Open-API-tests.git

RUN cp Open-API-tests/settings.xml /etc/maven2

RUN cp Open-API-tests/settings.xml /etc/maven

RUN cp Open-API-tests/settings.xml /.m2

WORKDIR /Open-API-tests

CMD ["mvn", "clean", "-DsuiteXmlFile=src/test/resources/SmokeTest.xml", "-Ddomain=dev", "test"]
