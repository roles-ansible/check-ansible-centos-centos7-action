FROM centos:centos7

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-centos-centos7-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-centos-centos7-action"

LABEL "com.github.actions.name"="check-ansible-centos-centos7"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS centos7"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

# link to vault after EOL for testing purposes only
RUN sed -i -e "/mirrorlist=/d" /etc/yum.repos.d/*.repo
RUN sed -i -e "s|#baseurl=http://mirror|baseurl=https://vault|" /etc/yum.repos.d/*.repo

RUN yum update --assumeyes && yum install --assumeyes epel-release

RUN yum install --assumeyes ansible \
    git

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
