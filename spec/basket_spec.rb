require 'basket'

describe Basket do
  let(:bibimbap) { double :bibimbap }
  let(:naengmyeon) { double :naengmyeon }
  # allow bibimbap to 
  it 'initializes with an empty basket to store items and prices' do
    expect(subject.basket).to eq([])
  end
  it 'adds an item and price to the basket' do
    subject.add_item({bibimbap=>10.50})
    expect(subject.basket).to eq([{bibimbap=>10.50}]) 
  end
  it 'adds multiple items and prices to the basket' do
    subject.add_item({bibimbap=>10.50})
    subject.add_item({naengmyeon=>8.00})
    expect(subject.basket).to eq([{bibimbap=>10.50}, {naengmyeon=>8.00}]) 
  end
end
