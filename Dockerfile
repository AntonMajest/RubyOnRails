FROM ruby:2.7.4

# RUN apt-get update \
#     && apt-get install -y --no-install-recommends \
#         postgresql-client \
#     && rm -rf /var/lib/apt/lists/*



WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]