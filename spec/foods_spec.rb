require 'foods'

describe Burger do
  it 'has the expected price' do
    expect(subject.price).to eq Burger::PRICE
  end
end

describe Fried_Chicken do
  it 'has the expected price' do
    expect(subject.price).to eq Fried_Chicken::PRICE
  end
end

describe Chicken_Nuggets do
  it 'has the expected price' do
    expect(subject.price).to eq Chicken_Nuggets::PRICE
  end
end

describe Pie do
  it 'has the expected price' do
    expect(subject.price).to eq Pie::PRICE
  end
end

describe Fries do
  it 'has the expected price' do
    expect(subject.price).to eq Fries::PRICE
  end
end

describe Onion_Rings do
  it 'has the expected price' do
    expect(subject.price).to eq Onion_Rings::PRICE
  end
end
