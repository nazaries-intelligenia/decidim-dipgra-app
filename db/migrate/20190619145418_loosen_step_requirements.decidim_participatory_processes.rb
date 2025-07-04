# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20170116135237)
# This file has been modified by `decidim upgrade:migrations` task on 2025-07-04 09:17:40 UTC
class LoosenStepRequirements < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:decidim_participatory_process_steps, :short_description, true)
    change_column_null(:decidim_participatory_process_steps, :description, true)
  end
end
