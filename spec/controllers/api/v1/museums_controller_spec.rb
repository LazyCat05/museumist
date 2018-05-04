require 'rails_helper'
RSpec.describe Api::V1::MuseumsController, type: :controller do
  before(:each) do
    ica = create(:museum, name: "ICA", location: "Boston")
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
      expect(returned_json['museums'][0]["name"]).to eq "ICA"
      expect(returned_json['museums'][1]["name"]).to eq "Museum 1"
    end
  end
  describe "GET#show" do
    it "should return a single museum" do
      ica = create(:museum, name: "ICA", location: "Boston")
      user1 = create(:user)
      user2 = create(:user)
      create(:review, user: user1, body: "It was nice", rating: 4, museum: ica)
      create(:review, user: user2, body: "It was not nice", rating: 1, museum: ica)
      get :show, params: { id: ica.id }
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json.length).to eq 9
      expect(returned_json["name"]).to eq "ICA"
      expect(returned_json["reviews"].length).to eq 2
      expect(returned_json["reviews"][0]["body"]).to eq "It was nice"
    end
  end
end
