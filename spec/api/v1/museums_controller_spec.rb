require 'rails_helper'
RSpec.describe Api::V1::MuseumsController, type: :controller do
  before(:each) do
    create(:museum, name: "ICA", location: "Boston")
    create_list(:museum, 2)
    create(:museum, name: "Boston Children's Museum", location: "Boston")
  end
  describe "GET#index" do
    it "should return a list of all the museums" do
      get :index
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
      expect(returned_json.length).to eq 1
      expect(returned_json["museums"].length).to eq 4
      expect(returned_json["museums"][0]["name"]).to eq "ICA"
      expect(returned_json["museums"][1]["name"]).to eq "Museum 1"
    end
  end
end
