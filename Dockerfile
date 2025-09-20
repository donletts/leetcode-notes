# Use an official Rust image to build lychee
FROM rust:latest as builder

# Install lychee
RUN cargo install lychee

# Use a lightweight runtime image
FROM debian:bookworm-slim

# Install CA certificates for HTTPS checks
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates git make \
 && rm -rf /var/lib/apt/lists/*

# Copy lychee binary from builder
COPY --from=builder /usr/local/cargo/bin/lychee /usr/local/bin/lychee

# get rest of build args
# ARG user_name
# ARG user_uid
# ARG user_gid

# Set working directory inside container
WORKDIR /app

# add host user to the container
# RUN groupadd -o --gid ${user_gid} ${user_name} \
#     && useradd -s /bin/bash --uid ${user_uid} --gid ${user_gid} -m ${user_name} \
#     && mkdir -p /home/${user_name}/.vscode-server \
#     && chown ${user_uid}:${user_gid} /home/${user_name}/.vscode-server* \
#     && echo ${user_name} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${user_name} \
#     && mkdir -p /etc/sudoers.d/${user_name} \
#     && chmod 0440 /etc/sudoers.d/${user_name}
