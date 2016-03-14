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
# I would like to check that the total I have been given matches the
# sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and
# will be delivered before 18:52" after I have ordered
# require 'pry'
require 'order'
describe Order do
  let(:menu) { double :menu, find_dish: dish }
  let(:dish) { double :dish, price: 10, name: 'Rice-cakes' }
  let(:delivery) { double :delivery, dispatch: nil}
  let(:delivery_klass) { double :delivery_klass, new: delivery }
  subject(:order) do
    described_class.new(menu: menu, delivery_klass: delivery_klass)
  end

  before { order.add('dish', 25) }
  describe '#add' do
    it 'adds a dish with its quantity to the current order' do
      expect(order.details).to include(dish: dish, quantity: 25)
    end
  end

  describe '#remove' do
    it 'removes a dish with its quantity from the current order' do
      order.remove('Rice-cakes')
      expect(order.details).to be_empty
    end
  end

  describe '#view' do
    it 'shows returns the content of the order' do
      expected_dish = { name: dish.name, quantity: 25, sub_total: 250 }
      expect(order.view).to include expected_dish
    end
  end

  describe '#summary' do
    it 'shows an order summary' do
      summary_response = "Total: $#{dish.price * 25}.00"
      expect(order.summary).to eq summary_response
    end
  end

  describe '#complete' do
    it 'completes the order' do
      order.complete
      expect(order.details).to be_empty
    end
    it 'it initaites a text message' do
      expect(delivery).to receive(:dispatch)
      order.complete
    end
  end
end
