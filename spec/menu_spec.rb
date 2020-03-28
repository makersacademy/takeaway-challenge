require 'menu'

describe Menu do

  it 'returns a list of dishes on #list' do
    expect(subject.list).to eq "Chips: £3 \nFish: £5\nSalad: £2"
  end

  it 'contains a hash of dishes' do
    expect(subject.dishes).to eq [{1 => Chips, 2 => Fish, 3 => Salad}]
  end

end
