require 'order_factory'
require 'order'

describe OrderFactory do
  let(:dish1) { double :dish, name: 'soup', price: 4 }
  let(:dish_view) { double :dish_view, display: "dishes" }
  let(:dish_view_class) { double :dish_view_class, new: dish_view }
  let(:items) { [dish1] }
  let(:category) { double :category, name: 'name', items: items }
  let(:categories) { [category] }
  let(:menu) { double :menu, categories: categories, find_item_by_name: dish1 }
  let(:order_array) { [['soup', 1]] }
  let(:order) { double :order }
  let(:order_class) { double :order_class, new: order }
  subject { described_class.new(menu, order_class) }

  context 'create order from a string' do

    describe '#create_order' do
      it 'creates an order obejct' do
        expect(order_class).to receive(:new)
        subject.create_order(order_array)
      end
    end

    describe '#make_items_list' do
      it 'creates items list from an order list' do
        expect(subject.make_items_list(order_array)).to eq [[dish1, 1]]
      end
    end

  end

end
