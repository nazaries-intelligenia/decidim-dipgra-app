# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20161011141033)
# This file has been modified by `decidim upgrade:migrations` task on 2025-07-04 09:17:39 UTC
class AddBannerImageToProcesses < ActiveRecord::Migration[5.0]
  def change
    add_column :decidim_participatory_processes, :banner_image, :string
  end
end
