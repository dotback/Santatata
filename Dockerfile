FROM ghcr.io/cirruslabs/flutter:3.27.1

WORKDIR /app
COPY . .

RUN flutter config --no-analytics && \
  flutter config --enable-web && \
  flutter pub get && \
  flutter build web --wasm

CMD ["flutter", "run", "--no-build", "--release", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]