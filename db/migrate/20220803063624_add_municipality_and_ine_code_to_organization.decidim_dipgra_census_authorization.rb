# This migration comes from decidim_dipgra_census_authorization (originally 20220617072813)
class AddMunicipalityAndIneCodeToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :decidim_organizations, :municipality_code, :integer
    add_column :decidim_organizations, :ine_code, :integer
  end
end
