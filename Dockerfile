FROM demandjump/target-s3:latest

RUN yum update -y
RUN yum install which python27-pip python36-pip -y

COPY ./ /app/

WORKDIR /app/tap-facebook

RUN ["python3", "/app/tap-facebook/setup.py", "install"]

WORKDIR /app/

RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]