require 'menu'

describe Menu do

  it 'Should initialize with menu array' do
    expect(subject.menu).to eq [
      { item: "Devil's Cauliflower", price: 4 },
      { item: "Rainbow Pot", price: 3 },
      { item: "Oreo Brownie", price: 3 },
    ]
  end
end
