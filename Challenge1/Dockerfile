# Estágio 1: Construir a aplicação
ARG RUBY_VERSION=3.0.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as builder

WORKDIR /rails

# Copiar os arquivos Gemfile e Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instalar as dependências necessárias para compilar o 'pg'
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config libpq-dev && \
    bundle config set --global frozen false && \
    bundle install --jobs "$(nproc)" && \
    bundle exec bootsnap precompile --gemfile

# Copiar o restante do código da aplicação
COPY . .

# Pré-compilar ativos e preparar a aplicação para o estágio final
RUN bundle exec bootsnap precompile app/ lib/ && \
    SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Estágio 2: Criar a imagem final
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim

WORKDIR /rails

# Instalar dependências necessárias para implantação
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config libpq-dev

# Copiar os artefatos construídos do estágio anterior
COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /rails /rails

# Configurar e executar a aplicação como um usuário não-root por motivos de segurança
RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp

USER rails:rails

# Ponto de entrada que prepara o banco de dados
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Expor a porta 3000 e iniciar o servidor por padrão
EXPOSE 3000
CMD ["./bin/rails", "server"]

