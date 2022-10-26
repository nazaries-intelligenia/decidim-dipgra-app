# frozen_string_literal: true

class AddMunicipalityAndIneCodeToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_organizations, :municipality_code, :integer
    add_column :decidim_organizations, :ine_code, :integer
  end
end
