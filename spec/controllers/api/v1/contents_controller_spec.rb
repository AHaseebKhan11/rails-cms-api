require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do
  let!(:content) { create(:content, :published) }
  let!(:drafts) { create_list(:content, 10, :draft) }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'checks JSON body response contains expected keys only' do
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq 1
      expect(json_response[0].keys).to eq(%w[title published_date author summary content])
    end

    it 'checks JSON body response contains correct count of objects for multiple records' do
      FactoryBot.create_list(:content, 5, :published)
      get :index, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response.count).to eq 6
    end

    it 'checks date format from json response' do
      json_response = JSON.parse(response.body)
      expect(json_response[0]['published_date']).to eq Content.first.published_date.strftime('%d-%m-%Y')
    end
  end
end
