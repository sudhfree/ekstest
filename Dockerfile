FROM python:3.10-bullseye
LABEL org.opencontainers.image.authors="<sudhakar srivastava>"
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

# Install node prereqs, nodejs and yarn
# Ref: https://deb.nodesource.com/setup_20.x
# Ref: https://yarnpkg.com/en/docs/install
ARG TERRAFORM_VERSION=1.5
ARG TERRAGRUNT_VERSION=0.48.0
RUN \
  echo "deb https://deb.nodesource.com/node_20.x bullseye main" > /etc/apt/sources.list.d/nodesource.list && \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list && \
  wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get upgrade -yqq && \
  apt-get install -yqq nodejs yarn git && \
  pip install -U pip && pip install pipenv && \
  curl -sSL https://install.python-poetry.org | python - && \
  apt-get install -y gnupg software-properties-common && \
  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
  gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint && \
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
  apt update && \
  apt-get install -y terraform && \
  mkdir /opt/tmp && cd /opt/tmp && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && ./aws/install && \
  #helm and kubectl setup
  mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg && \
  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
  apt-get update && \
  apt-get install -y kubectl && \
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && \
  ./get_helm.sh && \
  rm -rf /var/lib/apt/lists/*  




WORKDIR /opt/work

  
  
