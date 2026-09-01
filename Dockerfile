FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CONDA_DIR=/opt/conda
ENV CONDA_ENV_NAME=cs-project-docker
ENV PATH="${CONDA_DIR}/envs/${CONDA_ENV_NAME}/bin:${CONDA_DIR}/bin:/usr/local/bin:${PATH}"

ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    gdb \
    make \
    cmake \
    ninja-build \
    openjdk-21-jdk \
    git \
    git-lfs \
    gh \
    curl \
    wget \
    ca-certificates \
    zstd \
    unzip \
    zip \
    tar \
    vim \
    nano \
    less \
    procps \
    lsof \
    file \
    pkg-config \
    net-tools \
    iputils-ping \
    dnsutils \
    tree \
    tmux \
    bzip2 \
    sudo \
    openssh-client \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libfreetype6 \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN if [ "${TARGETARCH}" = "arm64" ]; then \
        MINIFORGE_ARCH="aarch64"; \
    elif [ "${TARGETARCH}" = "amd64" ]; then \
        MINIFORGE_ARCH="x86_64"; \
    else \
        echo "Unsupported TARGETARCH: ${TARGETARCH}" && exit 1; \
    fi \
    && wget -qO /tmp/miniforge.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-${MINIFORGE_ARCH}.sh" \
    && bash /tmp/miniforge.sh -b -p "${CONDA_DIR}" \
    && rm -f /tmp/miniforge.sh \
    && "${CONDA_DIR}/bin/conda" clean -afy

COPY environment.yml /tmp/environment.yml

RUN "${CONDA_DIR}/bin/conda" env create -f /tmp/environment.yml \
    && "${CONDA_DIR}/bin/conda" clean -afy \
    && rm -f /tmp/environment.yml

RUN echo "source ${CONDA_DIR}/etc/profile.d/conda.sh && conda activate ${CONDA_ENV_NAME}" >> /root/.bashrc

WORKDIR /workspace

CMD ["/bin/bash"]