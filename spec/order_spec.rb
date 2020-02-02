require 'order'

describe Order do
  let (:order) { Order.new(1) }

  it 'shows a dish' do
    expect(order.dish).to eq "Egg Paneer Kathi Roll"
  end

  it 'shows a quantity of 1' do
    expect(order.quantity).to eq 1
  end

  it 'shows the cost from menu' do
    expect(order.cost).to eq 4
  end

  context 'when quantity of more than one selected' do
      let(:multi_order) { Order.new(1, 2) } 

    it 'shows a quantity of more than one' do
      expect(multi_order.quantity).to eq 2
    end

    it 'shows the total cost of multiple dishes' do
      expect(multi_order.cost).to eq 8
    end
  end

end
