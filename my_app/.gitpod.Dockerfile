FROM gitpod/workspace-full

USER gitpod

# Install Flutter
RUN sudo apt-get update && sudo apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip libglu1-mesa

RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /home/gitpod/flutter
ENV PATH="/home/gitpod/flutter/bin:/home/gitpod/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Pre-download development binaries (added 'flutter config' line)
RUN flutter config --no-analytics
RUN flutter precache

