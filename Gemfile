# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "~> 0.28.0"

gem "decidim", DECIDIM_VERSION
gem "decidim-dipgra_census_authorization", path: "decidim-dipgra_census_authorization"

gem "decidim-clave", git: "https://github.com/nazaries-intelligenia/decidim-module-clave.git"
gem "decidim-file_authorization_handler", git: "https://github.com/nazaries-intelligenia/decidim-file_authorization_handler.git", branch: "deps/decidim-0.28"
gem "decidim-term_customizer", git: "https://github.com/mainio/decidim-module-term_customizer.git"

gem "puma"
gem "uglifier", ">= 1.3.0"
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
  gem "mdl"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end
