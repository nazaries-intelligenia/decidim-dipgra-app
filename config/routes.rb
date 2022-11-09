# frozen_string_literal: true

Rails.application.routes.draw do
  mount Decidim::Core::Engine => "/"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Decidim::FileAuthorizationHandler::AdminEngine => "/admin"
end
