require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#add_food_item' do
    let(:description) { 'a food item' }
    let(:quantity) { 1 }
    let(:unit_price) { 10 }

    it 'new ordered food item is added to order' do
      expect { order.add_food_item(description, quantity, unit_price) }
        .to change { order.order_items.count }.from(0).to(1)
    end

    it 'order total_value changes by the expected amount' do
      order.add_food_item(description, quantity, unit_price)
      expect { order.add_food_item(description, quantity, unit_price) }
        .to change { order.total_value }.by(quantity * unit_price)
    end
  end

  describe '#order_items' do
    it 'a new order should have no order_items' do
      expect(order.order_items.count).to eq(0)
    end
  end

  describe '#total_value' do
    it 'a new order should have zero total value' do
      expect(order.total_value).to eq(0)
    end
  end
end
