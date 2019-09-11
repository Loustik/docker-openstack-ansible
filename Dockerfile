
FROM centos:7

RUN yum -y install git epel-release gcc openssl-devel python-pip python-wheel python-virtualenv python-virtualenvwrapper which; yum clean all;

# location of virtualenvwrapper.sh
RUN source /usr/bin/virtualenvwrapper.sh

# directory to store virtual environments
RUN export WORKON_HOME=$HOME/.virtenvs

# Create a new virtual environment.
RUN mkvirtualenv os_cli

# Upgrade pip
RUN pip install pip --upgrade

# Configure Openstack CLI
RUN pip install --upgrade --requirement https://raw.githubusercontent.com/platform9/support-locker/master/openstack-clients/requirements.txt --constraint https://raw.githubusercontent.com/openstack/requirements/stable/pike/upper-constraints.txt

CMD ["/usr/sbin/init"]
