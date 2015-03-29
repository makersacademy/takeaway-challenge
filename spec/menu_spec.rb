require 'menu'

describe Menu do
  it 'has a hash of items that can be bought' do
    expect(subject.list).to eq(Burger: 5, Pizza: 10, Coke: 1)
  end

  it 'can make a nicely formatted list of items that can be bought'

  it 'can add an ordered item to a list' do
    subject.order(:Burger)
    expect(subject.customer_order).to eq(Burger: 5)
  end

  it 'can add multiple ordered items to a list' do
    subject.order(:Burger, :Coke)
    expect(subject.customer_order).to eq(Burger: 5, Coke: 1)
  end

  it 'cannot add items that are not on the menu' do
    expect do
      subject.order(:Lobster)
    end.to raise_error 'Sorry, that item isn\'t on our menu'
  end

  it 'can sum the prices of the ordered items'
end
