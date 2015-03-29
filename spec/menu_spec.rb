require 'menu'

describe Menu do
  it 'has a hash of items that can be bought' do
    expect(subject.list).to eq(Burger: 5, Pizza: 10, Coke: 1)
  end

  it 'can make a nicely formatted list of items that can be bought' do
  end

  it 'can add an ordered item to a list'

  it 'can add multiple ordered items to a list'

  it 'can sum the prices of the ordered items'
end