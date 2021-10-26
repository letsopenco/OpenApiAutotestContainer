FROM rt715/open:app_api_tests as build

RUN apt update

RUN apt -y upgrade

RUN apt -y install git

RUN apt -y install maven

RUN git init

RUN git clone https://git_user_name:git_access_token@github.com/letsopenco/Open-API-tests.git

RUN git pull https://git_user_name:git_access_token@github.com/letsopenco/Open-API-tests.git

RUN cp Open-API-tests/settings.xml /etc/maven2

RUN cp Open-API-tests/settings.xml /etc/maven

RUN cp Open-API-tests/settings.xml /.m2

WORKDIR /Open-API-tests

ENV domain=loc

ENV fullLog=true

ENV protocol=http

CMD ["mvn", "clean", "-DsuiteXmlFile=src/test/resources/SmokeTest.xml", "-Dprotocol=http", "-Ddomain=loc", "-DfullLogs=false", "test"]