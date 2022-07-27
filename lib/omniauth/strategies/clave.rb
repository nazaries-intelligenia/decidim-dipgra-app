# frozen_string_literal: true

require "omniauth-saml"
require "clave_services/msg_builder"

module OmniAuth
  module Strategies
    # OAuth references:
    # - https://github.com/omniauth/omniauth/wiki/Strategy-Contribution-Guide
    # - https://github.com/omniauth/omniauth/blob/master/lib/omniauth/strategy.rb
    # - https://github.com/omniauth/omniauth-oauth2/blob/master/lib/omniauth/strategies/oauth2.rb
    class Clave < ::OmniAuth::Strategies::SAML
      def info
        h= OmniAuth::Strategy.instance_method(:info).bind(self).call
        # last_name contains both surnames (García Rodríguez in Antonio García Rodríguez)
        h["name"]= [h["name"], h["last_name"]].join(" ")
        h["nickname"]= h["name"].gsub(" ", "_").downcase
        h
      end
    end
  end
end
