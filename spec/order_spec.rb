require 'order'

describe Order do
  it 'lets the customer select a number of available dishes' do
    expect(subject.select(1)).to eq([{name: 'item1', cost: 1.0}])
  end

  it 'adds a number of dishes to order' do
    subject.select(1)
    subject.select(2)
    expect(subject.order).to eq([{name: 'item1', cost: 1.0}, {name: 'item2', cost: 2.0}])
  end
end