# frozen_string_literal: true

Deface::Override.new(virtual_path: "decidim/system/organizations/_advanced_settings",
                     name: "add_dipgra_census_settings",
                     insert_before: "erb[silent]:contains('each do |partial|')",
                     text: "<%= render partial: 'dipgra_census_settings', locals: { f: } %>")
