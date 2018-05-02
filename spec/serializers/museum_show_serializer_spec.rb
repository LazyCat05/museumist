require 'rails_helper'

RSpec.describe MuseumShowSerializer < ActiveModel::Serializer, type: :serializer do
  describe 'review_average' do
    it 'should return a calculated review average' do
      ica = create(:museum, name: 'ICA', location: 'Boston')
      user1 = create(:user)
      user2 = create(:user)
      create(:review, user: user1, body: 'It was nice', rating: 4, museum: ica)
      create(:review, user: user2, body: 'It was not nice', rating: 4, museum: ica)

      ica_serializer = MuseumShowSerializer.new(ica)
      expect(ica_serializer.serializable_hash[:name]).to eq 'ICA'
      expect(ica_serializer.serializable_hash[:reviews].length).to eq 2
      expect(ica_serializer.serializable_hash[:review_average]).to eq 4
    end

    it 'should return zero for no average' do
      mfa = create(:museum, name: 'MFA', location: 'Boston')
      user1 = create(:user)
      user2 = create(:user)

      mfa_serializer = MuseumShowSerializer.new(mfa)
      expect(mfa_serializer.serializable_hash[:name]).to eq 'MFA'
      expect(mfa_serializer.serializable_hash[:reviews].length).to eq 0
      expect(mfa_serializer.serializable_hash[:review_average]).to eq 0
    end
  end
end
