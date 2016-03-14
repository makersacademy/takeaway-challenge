require 'restaurant'

describe Restaurant do
  let(:menu) { double(:menu, view: nil) }
  let(:order) { double(:order, add: nil, view: 'Orders') }
  let(:menu) { double :menu }
  let(:order_klass) { double(:order_klass, new: order) }
  let(:dish_name) { 'Pizza' }
  let(:quantity) { 7 }
  subject(:restaurant) do
    described_class.new(menu_instance: menu, order_klass: order_klass)
  end
  context 'There is an active order' do
    before { restaurant.order_add(dish_name, quantity) }
    describe '#view_menu' do
      it 'returns a list of available dishes' do
        expect(menu).to receive(:dishes)
        restaurant.view_menu
      end
    end

    describe '#order_add' do
      it 'adds a dish to your order' do
        expect(order).to receive(:add).with(dish_name, quantity)
        restaurant.order_add(dish_name, quantity)
      end
    end

    describe '#order_remove' do
      it 'removes a dish from your order' do
        expect(order).to receive(:remove).with(dish_name)
        restaurant.order_remove(dish_name)
      end
    end

    describe '#checkout' do
      it 'finishes your order' do
        expect(order).to receive(:complete)
        restaurant.checkout(250)
      end
    end

    describe '#view_order' do
      it 'returns list of all the items ordered' do
        expect(order).to receive(:view)
        restaurant.view_order
      end
    end

    describe '#order_summary' do
      it 'Returns the total price of your goods and a summary' do
        expect(order).to receive(:summary)
        restaurant.order_summary
      end
    end
  end
end
