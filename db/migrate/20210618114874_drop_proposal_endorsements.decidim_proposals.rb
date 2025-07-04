# frozen_string_literal: true

# This migration comes from decidim_proposals (originally 20200120230130)
# This file has been modified by `decidim upgrade:migrations` task on 2025-07-04 09:17:40 UTC
class DropProposalEndorsements < ActiveRecord::Migration[5.2]
  def change
    drop_table :decidim_proposals_proposal_endorsements, if_exists: true, force: :restrict
    remove_column :decidim_proposals_proposals, :proposal_endorsements_count
  end
end
