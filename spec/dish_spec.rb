require 'dish'

describe Dish do
  subject(:dish) { described_class.new(cost: 500, name: 'Copius Mushroom Skewers') }
  it "knows its price" do
    expect(subject.cost).to eq 500
  end

  it 'knows its name' do
    expect(subject.name).to eq 'Copius Mushroom Skewers'
  end
end