require 'rails_helper'
RSpec.describe Api::V1::MuseumsController, type: :controller do
  before(:each) do
    ica = create(:museum, name: "ICA", location: "Boston")
    create_list(:museum, 2)
    create(:museum, name: "Boston Children's Museum", location: "Boston")
    create(:review, body: "It was nice", rating: 4, museum: ica)
    create(:review, body: "It was not nice", rating: 1, museum: ica)
  end
  describe "GET#index" do
    it "should return a list of all the museums" do
      get :index
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
      expect(returned_json.length).to eq 1
      expect(returned_json["museums"].length).to eq 4
      expect(returned_json['museums'][0]["name"]).to eq "ICA"
      expect(returned_json['museums'][1]["name"]).to eq "Museum 1"
    end
  end
  describe "GET#show" do
    it "should return a single museum" do
      ica = create(:museum, name: "ICA", location: "Boston")
      get api_v1_museum_path(ica)
      save_and_open_page
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json).length.to eq 1
      expect(returned_json["name"]).to eq "ICA"
      expect(returned_json["review_list"].length).to eq 2
      expect(returned_json["review_list"][0]["body"]).to eq "It was nice"
    end
  end
end
