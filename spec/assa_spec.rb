# frozen_string_literal: true
# rubocop:disable Discourse/NoJsonParseResponse

RSpec.describe "apple-app-site-association",:type => :request do
  describe './wel-known/apple-app-site-association returns the same response as apple-app-site-association' do
    it 'returns 404 by default' do
      get "/apple-app-site-association"
      expect(response.status).to eq(404)
      get "/.well-known/apple-app-site-association"
      expect(response.status).to eq(404)
    end

    it 'returns the right output' do
      SiteSetting.app_association_ios = <<~JSON
        {
          "applinks": {
            "apps": []
          }
        }
      JSON
      get "/apple-app-site-association"

      expect(response.status).to eq(200)
      expect(response.body).to include("applinks")
      expect(response.media_type).to eq('application/json')
      expect(response.headers["Cache-Control"]).to eq('max-age=60, private')

      get "/.well-known/apple-app-site-association"
      expect(response.status).to eq(200)
      expect(response.body).to include("applinks")
      expect(response.media_type).to eq('application/json')
      expect(response.headers["Cache-Control"]).to eq('max-age=60, private')
    end
  end
end