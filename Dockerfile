FROM scratch
LABEL maintainer='guzhongren@live.cn'
COPY ["./linux/", "/Server/"]
WORKDIR /Server/
ENTRYPOINT [ "./run.sh" ]