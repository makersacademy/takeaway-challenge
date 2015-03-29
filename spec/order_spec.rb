require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:Burger) { double :dishes, name: 'Burger', price: 10.99 }

  it 'has is empty when created' do
    expect(order.new_order).to be_empty
  end

  it 'can add a dish to order' do
    order.add :burger 10
    expect(order.add).to eq [burger: 10] 
  end 
end