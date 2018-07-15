FROM scatch
ADD ["./linux/", '/Server']
WORKDIR /Server
ENTRYPOINT [ "./run.sh" ]