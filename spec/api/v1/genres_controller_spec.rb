require 'rails_helper'


RSpec.describe Api::V1::GenresController, type: :controller do
  before(:each) do
    create(:genre, name: "Science")
    create_list(:genre, 2)
    create(:genre, name: "History")
  end
  describe "GET#index" do
    it "should return a list of all the genres" do
      get :index
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
      expect(returned_json.length).to eq 1
      expect(returned_json["genres"].length).to eq 4
      expect(returned_json["genres"][0]["name"]).to eq "Science"
      expect(returned_json["genres"][3]["name"]).to eq "History"
    end
  end
end
