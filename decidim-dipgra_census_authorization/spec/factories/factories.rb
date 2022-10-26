# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.modify do
  factory :organization, class: "Decidim::Organization" do
    ine_code { 20 }
    municipality_code { 100 }
  end
end
