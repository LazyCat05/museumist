require 'rails_helper'
RSpec.describe Api::V1::MuseumsController, type: :controller do
    # describe "GET#index" do
    #   let!(:museum_1) { Museum.create(name: 'Maikol') }
    #
    #   it "serves up a JSON with all of my museum data" do
    #     get :index
    #
    #     expect(response.status).to eq 200
    #     expect(response.content_type).to "application/json"
    #   end
    # end
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
      expect(returned_json["museums"].length).to eq 2
      expect(returned_json["museums"][0]["name"]).to eq "ICA"
      expect(returned_json["museums"][1]["name"]).to eq "Boston Children's Museum"
    end
  end
  # describe "POST#create" do
  #   let!(:new_camper) { FactoryBot.create(:camper, name: "Flit") }
  #   let!(:camper_data) { { name: new_camper.name, campsite_id: new_camper.campsite_id }.to_json }
  #
  #   it "should create a new camper" do
  #     expect{ post(:create, body: camper_data) }.to change{ Camper.count }.by 1
  #   end
  #
  #   it "should return a json with the new camper data" do
  #     post(:create, body: camper_data)
  #     returned_json = JSON.parse(response.body)
  #
  #     expect(response.status).to eq 200
  #     expect(response.content_type).to eq "application/json"
  #
  #     expect(returned_json.length).to eq 1
  #     expect(returned_json["camper"]["name"]).to eq new_camper.name
  #     expect(returned_json["camper"]["campsite_id"]).to eq new_camper.campsite_id
  #   end
  # end
end
