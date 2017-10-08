require './lib/order.rb'

describe Order do

  let(:order_item_1) { double :order_item_1, name: 'Test Dish 1', description: 'Test dish 1 description', price: 10.95 }
  let(:order_item_2) { double :order_item_2, name: 'Test Dish 2', description: 'Test dish 2 description', price: 5.99 }
  let(:order_item_3) { double :order_item_3, name: 'Test Dish 3', description: 'Test dish 3 description', price: 2.50 }
  let(:order_item_4) { double :order_item_4, name: 'Test Dish 4', description: 'Test dish 4 description', price: 12.00 }

  subject(:order_empty) { described_class.new }

  context '#initialization' do
    it 'creates order' do
      expect(order_empty).to be_an_instance_of Order
    end

    it 'has an empty object_list injected' do
      expect(order_empty.order_items).to be_an_instance_of ObjectList
    end

    it { is_expected.to respond_to(:order_items) }
  end

end
