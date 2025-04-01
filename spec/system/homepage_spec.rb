# frozen_string_literal: true

require "spec_helper"

describe "Homepage" do
  include Decidim::SanitizeHelper

  let!(:organization) do
    create(
      :organization,
      default_locale: :es,
      available_locales: [:en, :es]
    )
  end
  let!(:hero) { create(:content_block, organization:, scope_name: :homepage, manifest_name: :hero, settings: { "welcome_text_en" => "Welcome to Decidim Application" }) }
  let!(:sub_hero) { create(:content_block, organization:, scope_name: :homepage, manifest_name: :sub_hero) }

  before do
    # rubocop:disable Rails/I18nLocaleAssignment
    I18n.locale = :en
    switch_to_host(organization.host)
    visit decidim.root_path(locale: I18n.locale)
    # rubocop:enable Rails/I18nLocaleAssignment
  end

  it "loads and shows organization name and main blocks" do
    visit decidim.root_path

    expect(page).to have_content("Decidim Application")
    within ".home .hero__container .hero" do
      expect(page).to have_content("Welcome to Decidim Application")
    end
    within "#sub_hero" do
      subhero_msg = translated(organization.description).gsub(%r{</p>\s+<p>}, "<br><br>").gsub(%r{<p>(((?!</p>).)*)</p>}mi, "\\1").sub("<script>", "").sub("</script>", "")
      expect(page).to have_content(subhero_msg)
    end
  end
end
