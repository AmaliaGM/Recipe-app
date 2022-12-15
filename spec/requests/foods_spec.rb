require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'John', email: 'john@mail.com', password: 'johntesting') }
  let(:food) { user.foods.create(name: 'carrot cake', measurement_unit: 'grams', price: 10) }

  describe 'GET /index' do
     before do
       sign_in user
       get foods_path
     end

     it 'should return response status correct (ok)' do
          expect(response).to have_http_status('200')
        end
end
end