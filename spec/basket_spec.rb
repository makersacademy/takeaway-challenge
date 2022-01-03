require 'basket'

describe Basket do
  let(:bibimbap) { double :bibimbap }
  # allow bibimbap to 
  it 'initializes with an empty basket to store items and prices' do
    expect(subject.basket).to eq({})
  end
  it 'adds an item and price to the basket' do
    subject.add_item(bibimbap, 10.50)
    expect(subject.basket).to eq({bibimbap=>10.50}) 
  end
end
