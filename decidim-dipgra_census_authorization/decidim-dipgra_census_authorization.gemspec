# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/dipgra_census_authorization/version"

DECIDIM_VERSION = "~> #{Decidim::DipgraCensusAuthorization::VERSION}"

Gem::Specification.new do |s|
  s.version = Decidim::DipgraCensusAuthorization::VERSION
  s.authors = ["Laura Jaime"]
  s.email = ["laura.jv@coditramuntana.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/CodiTramuntana/decidim-dipgra-app"
  s.required_ruby_version = ">= 2.7.5"

  s.name = "decidim-dipgra_census_authorization"
  s.summary = "AuthorizationHandler provider against the Diputacion of Granada"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "Rakefile", "README.md"]

  s.add_dependency "decidim", DECIDIM_VERSION
  s.add_dependency "savon", "~> 2.11.2"
  s.add_dependency "virtus-multiparams", "~> 0.1.1"

  s.add_development_dependency "decidim-dev", DECIDIM_VERSION
  s.add_development_dependency "faker"
end
