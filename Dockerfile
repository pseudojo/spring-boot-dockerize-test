#################
#  build stage  #
#################
FROM openjdk:11-jdk AS build

MAINTAINER pseudojo

WORKDIR /build

ADD . /build

RUN _branch=$( git branch | awk -v FS=' ' '/\*/{print $NF}' | sed 's|[()]||g' ) \
    _commithash="$( git rev-parse --verify HEAD )$( bash -c '[[ -z $(git status --porcelain) ]] || echo -dirty' )" \
    _builddate=$( TZ=KST-9 date '+%Y%m%d-%H%M%S' ) \
    && echo "build_version=${_branch}-${_commithash}" | tee -a /backend/.app_version \
    && echo "build_date=${_builddate}" | tee -a /backend/.app_version

RUN gradle clean build


#################
# release stage #
#################
FROM openjdk:11-jre-slim-buster AS release

MAINTAINER pseudojo

ENV APP_HOME=/home/app

RUN groupadd app && useradd -g app app \
  && mkdir -p /home/app \
  && chown -R app:app ${APP_HOME}

USER app
WORKDIR ${APP_HOME}

COPY --from=build /build/build/libs/*.jar /home/app/app.jar

EXPOSE 8080
ENTRYPOINT ["java"]
CMD ["-jar", "/home/app/app.jar"]
