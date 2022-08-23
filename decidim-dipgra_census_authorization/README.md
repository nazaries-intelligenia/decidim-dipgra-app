# Decidim::DipgraCensusAuthorization

A decidim package to provide user authorizations against the Diputación of Granada census API


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-dipgra_census_authorization'
```

And then execute:

```bash
bundle install
```

## Configuration

Once installed, the following env variables can be configured:

- **DIPGRA_CENSUS_URL**: URL to the DIPGRA census web service
- **DIPGRA_CENSUS_PUBLIC_KEY**: Public Key used in the DIPGRA web service authentication
- **DIPGRA_CENSUS_USERNAME**: Username for DIPGRA web service authentication
- **DIPGRA_CENSUS_PASSWORD**: Password for DIPGRA web service authentication

### Run tests

Create a dummy app in your application (if not present):

```bash
bin/rails decidim:generate_external_test_app
cd spec/decidim_dummy_app/
bundle exec rails decidim_dipgra_census_authorization:install:migrations
RAILS_ENV=test bundle exec rails db:migrate
cd ../..
```

And run tests:

```bash
bundle exec rspec spec
```

## License

AGPLv3 (same as Decidim)
