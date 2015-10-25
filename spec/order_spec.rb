require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:menu) { double('menu', :dishes => { "Golden French Fries" => 1 }) }

  context 'selecting an item from the menu' do

    it 'allows a customer to select an item' do
      order.add_item("Golden French Fries")
      expect(order.items).to include ( {"Golden French Fries" => 1})
    end

    it 'returns an error message if selected item is not on the menu' do
      expect { order.add_item("Chips") }.to raise_error "Sorry we don't have Chips on the menu"
    end
  end

  context 'it calculates the cost of the order' do

    it 'calculates the total price' do
      allow(menu).to receive(:price_matcher).and_return 0.5
      5.times{ order.add_item("Golden French Fries") }
      expect(order.total_price).to eq 2.5
    end
  end
end
