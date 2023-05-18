FROM alpine:latest

RUN apk update && apk upgrade \
 && apk add musl-dev clang git make cmake boost-dev

ADD . /service

RUN cmake --trace-expand  -S ./service -B out -DCMAKE_BUILD_TYPE=Release &&\
    cmake --build out

EXPOSE 8000 8000

ENTRYPOINT ["./out/FakeCloudCPP-CPPService"]
