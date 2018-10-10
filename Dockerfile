FROM java:7
LABEL maintainer="Marcos Eliziario <marcos.eliziario@gmail.com>"

ENV EMBULK_VERSION 0.9.8
ENV EMBULK_BIN /usr/bin/embulk
RUN set -ex && curl --create-dirs -L https://bintray.com/artifact/download/embulk/maven/embulk-${EMBULK_VERSION}.jar -o ${EMBULK_BIN} && chmod +x ${EMBULK_BIN} -o ${EMBULK_BIN} && chmod +x ${EMBULK_BIN}
RUN set -ex && ${EMBULK_BIN} gem install embulk-output-postgresql

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/opt/embulk.jar"]
CMD ["--help"]

