
FROM alpine:3.12.0@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321

RUN apk --no-cache add \
    ca-certificates \
    python3     \
    sudo

# create a user
ARG user_uid=1000
ARG user_gid=1000

ENV user_uid=$user_uid
ENV user_gid=$user_gid

RUN : "adding user" && \
  addgroup -g $user_gid user && \
  adduser  -D -G user -u $user_uid -g '' user && \
  echo '%user ALL=(ALL) NOPASSWD:ALL' | tee -a /etc/sudoers

USER user

ENV HOME=/home/user

WORKDIR $HOME

RUN \
  echo 'hello world' > index.html

ENTRYPOINT ["python3", "-m", "http.server", "8080"]

