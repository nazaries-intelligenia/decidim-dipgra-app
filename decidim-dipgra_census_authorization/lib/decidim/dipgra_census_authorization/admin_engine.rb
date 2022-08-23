# frozen_string_literal: true

module Decidim
  module DipgraCensusAuthorization
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::DipgraCensusAuthorization::Admin
    end
  end
end
