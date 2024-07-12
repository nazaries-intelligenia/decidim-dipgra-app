# frozen_string_literal: true

module Decidim
  module System
    module UpdateOrganizationOverride
      extend ActiveSupport::Concern

      included do
        private

        def save_organization
          organization.name = form.name
          organization.host = form.host
          organization.secondary_hosts = form.clean_secondary_hosts
          organization.force_users_to_authenticate_before_access_organization = form.force_users_to_authenticate_before_access_organization
          organization.available_authorizations = form.clean_available_authorizations
          organization.users_registration_mode = form.users_registration_mode
          organization.omniauth_settings = form.encrypted_omniauth_settings
          organization.smtp_settings = form.encrypted_smtp_settings
          organization.file_upload_settings = form.file_upload_settings.final
          organization.content_security_policy = form.content_security_policy
          # Customization for Dipra Census
          organization.ine_code = form.ine_code
          organization.municipality_code = form.municipality_code

          organization.save!
        end
      end
    end
  end
end
