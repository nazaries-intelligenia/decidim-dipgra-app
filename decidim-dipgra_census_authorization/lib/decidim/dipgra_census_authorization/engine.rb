# frozen_string_literal: true

require "rails"
require "active_support/all"

require "decidim/core"

module Decidim
  module DipgraCensusAuthorization
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::DipgraCensusAuthorization

      initializer "decidim_dipgra_census_authorization.add_authorization_handlers" do |_app|
        Decidim::Verifications.register_workflow(
          :dipgra_census_authorization_handler
        ) do |auth|
          auth.form = "DipgraCensusAuthorizationHandler"
        end
      end

      config.to_prepare do
        Decidim::System::RegisterOrganization.include(Decidim::System::RegisterOrganizationOverride)
        Decidim::System::UpdateOrganization.include(Decidim::System::UpdateOrganizationOverride)
        Decidim::System::UpdateOrganizationForm.include(Decidim::System::UpdateOrganizationFormOverride)
      end
    end
  end
end
