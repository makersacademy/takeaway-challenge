require 'checkout'

describe Checkout do

  context 'Check out an order' do

    let(:order) { double :order, dishes: [{'Korma': 4.95}, {'Red Curry': 5.95}, {'Red Curry': 5.95}, {'Green Curry': 6.95}] }

    it 'Checking the total cost of final order' do
      checkout = Checkout.new(order)
      expect(checkout.total order.dishes).to eq 23.8
    end

    it 'Print receipt for final order' do
      checkout = Checkout.new(order)
      expect(checkout.display_order order.dishes).to eq "[\"Korma @ £4.95 x 1\", \"Red Curry @ £5.95 x 2\", \"Green Curry @ £6.95 x 1\"]; TOTAL: £23.8"
    end

    it 'Order fails if no dishes added to order' do
      order = Order.new
      checkout = Checkout.new(order)
      expect { checkout.send_msg }.to raise_error 'No dishes have been added to the order'
    end

    it 'Sends confirmation message if order successful' do
      checkout = Checkout.new(order)
      expect(checkout.no_dishes_ordered?).to be false
    end

  end

end