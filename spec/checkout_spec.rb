require 'checkout'

describe Checkout do

  context 'Check out an order' do

    let(:order) { double :order, dishes: [{:name => 'Red curry', :price => 5.95}, {:name => 'Green curry', :price => 6.95}, {:name => 'Green curry', :price => 6.95}] }

    it 'Checking the total cost of the order' do
      checkout = Checkout.new (order)
      expect(checkout.show_final_order).to be true
      # expect(checkout.final_total).to eq 19.85
    end

    # it 'Print a receipt for the order' do
    # end

  end

end