require 'dish'

describe Dish do
  subject { Dish.new("Pad Thai", 5) }

  it 'has a name' do
    expect(subject.name).to eq("Pad Thai")
  end

  it 'has a price' do
    expect(subject.price).to eq(5)
  end
end
