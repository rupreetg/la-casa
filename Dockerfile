FROM ubuntu:latest

WORKDIR work

#add the script to docker env
ADD env-setup-script.sh ./env-setup-script.sh

#set the correct permission
RUN chmod +x env-setup-script.sh

RUN bash env-setup-script.sh

ENTRYPOINT ["/bin/bash"]
