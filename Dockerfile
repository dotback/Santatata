FROM dart:3.6.0 AS build

WORKDIR /app
COPY .fvmrc ./

# Install Flutter
RUN dart pub global activate fvm
ENV PATH="/root/.pub-cache/bin:${PATH}"
RUN fvm install

# Configure Flutter
RUN fvm flutter config --no-analytics
RUN fvm flutter config --enable-web
RUN fvm flutter doctor --suppress-analytics

# Build the app
COPY . .
RUN fvm flutter pub get && \
  fvm flutter build web --wasm

ENV PORT=80
CMD ["fvm", "flutter", "run", "--no-build", "--release", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
