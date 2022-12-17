require 'rails_helper'

RSpec.describe 'homepage', type: :request do
  describe 'GET /index' do
    before do
      get '/'
    end

    it 'should return response status correct (ok)' do
      expect(response).to have_http_status('302')
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
