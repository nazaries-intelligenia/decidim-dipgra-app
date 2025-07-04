# frozen_string_literal: true

# This migration comes from decidim_participatory_processes (originally 20170804125402)
# This file has been modified by `decidim upgrade:migrations` task on 2025-07-04 09:17:40 UTC
class AttachmentDescriptionNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :decidim_attachments, :description, :jsonb, null: true
  end
end
