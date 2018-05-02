require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  before(:each) do

    # visit new_user_session_path
    # fill_in 'Username', with: user1.username
    # fill_in 'Password', with: user1.password
    #
    # click_button 'Log in'
  end
  describe "POST#create" do
    it 'should add a new review' do
      iczm = create(:museum, name: 'International Cryptozoology Museum', location: 'Portland, Maine')
      user1 = create(:user)
      sign_in(user1, scope: :user)
      post_json = {museum_id: iczm.id, rating: 1, body: "Not enough on sea monsters"}.to_json

      post(:create, body: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json['rating']).to eq 1
      expect(returned_json['user_name']).to eq user1.username
    end
    it 'should return an error if a user is not signed in' do
      iczm = create(:museum, name: 'International Cryptozoology Museum', location: 'Portland, Maine')
      post_json = {museum_id: iczm.id, rating: 1, body: "Not enough on sea monsters"}.to_json

      post(:create, body: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json['id']).to eq 'error message'
      expect(returned_json['body']).to eq 'Please log in to leave a review'

    end
  end
end
