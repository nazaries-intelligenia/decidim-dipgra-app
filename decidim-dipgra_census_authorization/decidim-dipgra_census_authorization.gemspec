# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/dipgra_census_authorization/version"

DECIDIM_VERSION = "~> #{Decidim::DipgraCensusAuthorization::VERSION}".freeze

Gem::Specification.new do |s|
  s.version = Decidim::DipgraCensusAuthorization::VERSION
  s.authors = ["Laura Jaime"]
  s.email = ["laura.jv@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/CodiTramuntana/decidim-dipgra-app"
  s.required_ruby_version = ">= 3.3.4"

  s.name = "decidim-dipgra_census_authorization"
  s.summary = "AuthorizationHandler provider against the Diputacion of Granada"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim", DECIDIM_VERSION
  s.add_dependency "savon", "~> 2.11.2"

  s.add_development_dependency "decidim-dev", DECIDIM_VERSION
  s.add_development_dependency "faker"
  s.metadata["rubygems_mfa_required"] = "true"
end
