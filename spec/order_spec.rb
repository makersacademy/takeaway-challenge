require 'order'

describe Order do
  let(:menu) do 
    double 'Menu', menu: [{ name: 'item1', cost: 1},{ name: 'item2', cost: 2 },{ name: 'item3', cost: 3}]
  end
  
  it 'lets the customer select a number of available dishes' do
    expect(subject.select(1)).to eq([{name: 'item1', cost: 1.0}])
  end

  it 'adds a number of dishes to order' do
    subject.select(1)
    subject.select(2)
    expect(subject.order).to eq([{name: 'item1', cost: 1.0}, {name: 'item2', cost: 2.0}])
  end

  it { is_expected.to respond_to :order }
end