# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20180122110007)
# This file has been modified by `decidim upgrade:migrations` task on 2025-07-04 09:17:40 UTC
class AddPrivateToParticipatoryProcesses < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_participatory_processes, :private_space, :boolean, default: false
  end
end
