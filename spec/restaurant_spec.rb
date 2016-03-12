# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
#
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
require 'restaurant'

describe Restaurant do
  let(:menu) { double(:menu, view: nil) }
  let(:order) { double(:menu, add: nil) }
  let(:menu_klass) { double(:menu_klass, new: menu) }
  let(:order_klass) { double(:order_klass, new: order) }
  subject(:restaurant) do
    described_class.new(menu_klass: menu_klass, order_klass: order_klass)
  end

  describe '#view_menu' do
    it 'returns a list of available dishes' do
      expect(menu).to receive(:view)
      restaurant.view_menu
    end
  end

  describe '#order_add' do
    it 'adds a dish to your order' do
      dish_name = 'Pizza'
      quantity = 7
      expect(order).to receive(:add).with(dish_name, quantity)
      restaurant.order_add(dish_name, quantity)
    end
  end

  describe '#order_remove' do
    it 'removes a dish from your order' do
      dish_name = 'Pizza'
      quantity = 7
      expect(order).to receive(:remove).with(dish_name, quantity)
      restaurant.order_remove(dish_name, quantity)
    end
  end

  describe '#checkout' do
    it { is_expected.to respond_to(:checkout) }
    it 'finishes your order' do
      expect(order).to receive(:complete)
      restaurant.checkout
    end
  end

  describe '#view_order' do
    it { is_expected.to respond_to(:view_order) }
    it 'returns list of all the items ordered' do
      expect(order).to receive(:view)
      restaurant.view_order
    end
  end

  describe '#order_summary' do
    it { is_expected.to respond_to(:order_summary) }
    it 'returns list of all the items ordered' do
      expect(order).to receive(:summary)
      restaurant.order_summary
    end
  end
end
