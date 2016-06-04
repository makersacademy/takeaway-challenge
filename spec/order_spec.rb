require 'order'

describe Order do
  subject(:order) {described_class.new}

  describe '#add_item' do

    it 'adds selected item to the order' do
      expect(order.add_item(1)).to eq [{"Won Ton Soup" => 8}]
    end
  end

  describe '#total'
  it 'totals the items in the order' do
    order.add_item(1)
    expect(order.total).to eq 8
  end

  describe '#view_order' do

    it 'displays the current order with a subtotal' do
      order.add_item(1)
      expect(order.view_order).to eq 'Items: Won Ton Soup

      Total: 8'
    end
  end


end


