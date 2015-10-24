require 'foods'

describe Burger do
  it 'has the expected price' do
    expect(described_class.price).to eq Burger::SET_PRICE
  end
end

describe Fried_Chicken do
  it 'has the expected price' do
    expect(described_class.price).to eq Fried_Chicken::SET_PRICE
  end
end

describe Chicken_Nuggets do
  it 'has the expected price' do
    expect(described_class.price).to eq Chicken_Nuggets::SET_PRICE
  end
end

describe Pie do
  it 'has the expected price' do
    expect(described_class.price).to eq Pie::SET_PRICE
  end
end

describe Fries do
  it 'has the expected price' do
    expect(described_class.price).to eq Fries::SET_PRICE
  end
end

describe Onion_Rings do
  it 'has the expected price' do
    expect(described_class.price).to eq Onion_Rings::SET_PRICE
  end
end
