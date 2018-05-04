require 'rails_helper'
RSpec.describe Api::V1::VotesController, type: :controller do
  describe 'POST#create' do
    it 'should add a new vote' do
      iczm = create(:museum, name: 'International Cryptozoology Museum', location: 'Portland, Maine')
      user1 = create(:user)
      sign_in(user1, scope: :user)
      review = create(:review, museum_id: iczm.id, rating: 5, body: "I took my picture with bigfoot!", user_id: user1.id)

      post_json = {value: 1, review: review.id}.to_json

      post(:create, body: post_json)

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json['id']).to eq('message')
      expect(returned_json['body']).to eq('Your vote has been recorded')
      expect(returned_json['vote_total']).to eq(1)
    end
    it 'should change an existing vote to value 0 if the same value is sent' do
      iczm = create(:museum, name: 'International Cryptozoology Museum', location: 'Portland, Maine')
      user1 = create(:user)
      sign_in(user1, scope: :user)
      review = create(:review, museum_id: iczm.id, rating: 5, body: "I took my picture with bigfoot!", user_id: user1.id)
      existing_vote = Vote.create(review_id: review.id, user_id: user1.id, value: 1)

      post_json = {value: 1, review: review.id}.to_json

      post(:create, body: post_json)


      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['id']).to eq('message')
      expect(returned_json['body']).to eq('Your vote has been updated')
      expect(returned_json['vote_total']).to eq(0)
    end
    it 'should change the value of a vote to the opposite if the opposite value is sent' do
      iczm = create(:museum, name: 'International Cryptozoology Museum', location: 'Portland, Maine')
      user1 = create(:user)
      sign_in(user1, scope: :user)
      review = create(:review, museum_id: iczm.id, rating: 5, body: "I took my picture with bigfoot!", user_id: user1.id)
      existing_vote = Vote.create(review_id: review.id, user_id: user1.id, value: 1)

      post_json = {value: -1, review: review.id}.to_json

      post(:create, body: post_json)


      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200

      expect(returned_json['id']).to eq('message')
      expect(returned_json['body']).to eq('Your vote has been updated')
      expect(returned_json['vote_total']).to eq(-1)
    end
    it 'should return a message to log in if an unautheticated user tries to vote' do
      iczm = create(:museum, name: 'International Cryptozoology Museum', location: 'Portland, Maine')
      user1 = create(:user)
      review = create(:review, museum_id: iczm.id, rating: 5, body: "I took my picture with bigfoot!", user_id: user1.id)

      post_json = {value: -1, review: review.id}.to_json

      post(:create, body: post_json)


      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200

      expect(returned_json['id']).to eq('message')
      expect(returned_json['body']).to eq('Please log in to vote.')
      expect(returned_json['vote_total']).to eq(0)
    end
  end
end
