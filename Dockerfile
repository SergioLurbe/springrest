FROM openjdk:11 AS builder
WORKDIR /spring

COPY . ./
RUN ./gradlew assemble 
FROM openjdk:11.0-jre-slim-buster AS runtime 
WORKDIR opt/springrest
COPY --from=builder /spring/build/libs/springrest-0.0.1-SNAPSHOT.jar ./
CMD java -jar springrest-0.0.1-SNAPSHOT.jar
