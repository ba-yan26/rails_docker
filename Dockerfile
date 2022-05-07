FROM ruby:2.7
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
# 2~5行は必要なjavascript関連のインストールを実行
WORKDIR /app
COPY ./src /app
# srcディレクトリ以下のソースコードをappディレクトリにコピー
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install
# ruby関連のライブラリをインストール