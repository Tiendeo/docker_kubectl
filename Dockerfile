FROM python:3.8-slim-buster


# pip search awscli | grep -o "^awscli (.*)" | sed -n -e 's/^awscli (\(.*\))/\1/p'
ARG AWSCLI_VERSION=1.18.69

# curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt
ARG KUBERNETES_VERSION=v1.16.10

## Basic packages + helm
RUN apt update \
    && apt install -y bash jq ca-certificates less curl openssl tmux coreutils git libarchive-tools \
    # https://github.com/aws/aws-cli/issues/1957
    # && apt install -y groff \
    && pip install --upgrade --no-cache-dir awscli==$AWSCLI_VERSION \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod a+x /usr/local/bin/kubectl
