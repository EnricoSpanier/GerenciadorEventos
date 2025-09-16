
# Etapa 1: Build do app Flutter
FROM ubuntu:22.04 AS build

# Instala dependências do sistema
RUN apt-get update && \
	apt-get install -y curl git unzip xz-utils && \
	rm -rf /var/lib/apt/lists/*

# Instala Flutter
ENV FLUTTER_VERSION=3.19.6
RUN git clone https://github.com/flutter/flutter.git /flutter --branch $FLUTTER_VERSION --depth 1
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter doctor

# Copia o código do app
WORKDIR /app
COPY . .

# Build do app Flutter para web
RUN flutter pub get && flutter build web --release

# Etapa 2: Imagem final com nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

