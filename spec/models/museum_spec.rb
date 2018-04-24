require 'rails_helper'

describe Museum do
  let(:museum) do
    # FactoryBot.build(:museum)
  end

  it 'requires a name' do
    museum.name = nil
    expect(museum.save).to eq(false)
    expect(museum.errors[:name]).to_not be_nil
  end

  it 'requires a location' do
    museum.location = nil
    expect(museum.save).to eq(false)
    expect(museum.errors[:location]).to_not be_nil
  end

  it 'requires a founding date' do
    museum.description = nil
    expect(museum.save).to eq(false)
    expect(museum.errors[:description]).to_not be_nil
  end

  it 'requires a description' do
    museum.description = nil
    expect(museum.save).to eq(false)
    expect(museum.errors[:description]).to_not be_nil
  end
end
