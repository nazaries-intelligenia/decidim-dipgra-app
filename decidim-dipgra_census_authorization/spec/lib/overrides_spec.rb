# frozen_string_literal: true

require "spec_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-system",
    files: {
      "/app/commands/decidim/system/create_organization.rb" => "b7c49015ea3d682dbfd6d3c3f76e2d7a",
      "/app/commands/decidim/system/update_organization.rb" => "1fe0b3eb152fecdf63ef108743ae78e4",
      "/app/forms/decidim/system/update_organization_form.rb" => "3fe09b001d83030207a6f5faa256ac3b",
      "/app/views/decidim/system/organizations/_advanced_settings.html.erb" => "cbaf3ea59830ad669be2d4d2eca42902"
    }
  }
]

describe "Overriden files", type: :view do
  checksums.each do |item|
    spec = Gem::Specification.find_by_name(item[:package])

    item[:files].each do |file, signature|
      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
