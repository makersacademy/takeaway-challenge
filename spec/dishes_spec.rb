require 'dishes'

describe Dishes do
  # subject(:fried_rice){Dishes.new("Fried Rice", 2)}
  fried_rice = Dishes.new("Fried Rice", 2)
  it 'has a name' do
    expect(fried_rice.name).to eq("Fried Rice")
  end
  it 'has a price' do
    expect(fried_rice.price).to eq(2)
  end
end
