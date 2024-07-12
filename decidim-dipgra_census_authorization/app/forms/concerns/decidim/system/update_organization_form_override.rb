# frozen_string_literal: true

module Decidim
  module System
    module UpdateOrganizationFormOverride
      extend ActiveSupport::Concern

      included do
        attribute :ine_code, Integer
        attribute :municipality_code, Integer
      end
    end
  end
end
