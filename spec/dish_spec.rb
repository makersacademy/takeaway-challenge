require 'dish'

describe Dish do
  subject(:fish) { described_class.new(:Salmon, 14.99) }

  it 'knows its name' do
    expect(fish.name).to eq(:Salmon)
  end

  it 'knows its price' do
    expect(fish.price).to eq(14.99)
  end
end
