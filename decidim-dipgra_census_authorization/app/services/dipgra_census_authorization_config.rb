# frozen_string_literal: true

class DipgraCensusAuthorizationConfig
  DOCUMENT_TYPE = {
    nif: "1",
    passport: "2",
    residence_card: "3",
    dni: "6"
  }.freeze

  class << self
    def url
      Rails.application.secrets.dipgra_census[:url] || "http://dipgra.ws/services/Ci"
    end

    def username
      Rails.application.secrets.dipgra_census[:username] || "username"
    end

    def password
      Rails.application.secrets.dipgra_census[:password] || "password"
    end

    def public_key
      Rails.application.secrets.dipgra_census[:public_key] || "abcd12345"
    end

    def api_config(organization)
      {
        username: "#{organization.ine_code}#{username}",
        password:,
        organization:
      }
    end
  end
end
