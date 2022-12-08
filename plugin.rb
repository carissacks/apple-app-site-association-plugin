# frozen_string_literal: true

# name: apple app site association
# about: Plugin to serve apple-app-site-association in `.well-known` path
# version: 0.0.1
# authors: Lexicon
# url: https://github.com/carissacks/apple-app-site-association-plugin
# required_version: 2.7.0

after_initialize do
    Discourse::Application.routes.append do
      get ".well-known/apple-app-site-association" => "metadata#app_association_ios", format: false
    end
end