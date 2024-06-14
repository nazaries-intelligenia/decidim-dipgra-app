# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "~> 0.27.5"

gem "decidim", DECIDIM_VERSION
gem "decidim-dipgra_census_authorization", path: "decidim-dipgra_census_authorization"
gem "decidim-file_authorization_handler", git: "https://github.com/CodiTramuntana/decidim-file_authorization_handler.git", tag: "v0.27.1.2"
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer.git"

gem "decidim-clave", git: "https://github.com/CodiTramuntana/decidim-module-clave.git"

# temporal solution while gems embrace new psych 4 (the default in Ruby 3.1) behavior.
gem "psych", "< 4"

gem "puma"
gem "uglifier", ">= 1.3.0"
gem "webpacker"
gem "whenever"

gem "daemons"
gem "delayed_job_active_record"
gem "figaro", ">= 1.1.1"
gem "openssl"

gem "deface"

# elsif deploying to a PaaS like Heroku
# gem "redis"
# gem "sidekiq"
# group :production do
#   gem "aws-sdk-s3", require: false
#   gem "fog-aws"
#   gem "rack-ssl-enforcer"
#   gem "rails_12factor"
# end
# endif

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "bootsnap"
  gem "byebug", platform: :mri
  gem "decidim-dev", DECIDIM_VERSION
  gem "faker"
end

group :development do
  gem "letter_opener_web"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end
