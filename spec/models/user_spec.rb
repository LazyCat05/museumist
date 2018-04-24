require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    FactoryBot.build(:user)
  end
  it { expect(true).to be true }
end
