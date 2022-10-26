# frozen_string_literal: true

Decidim::System::UpdateOrganizationForm.class_eval do
  attribute :ine_code, Integer
  attribute :municipality_code, Integer
end
