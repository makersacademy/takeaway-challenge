require 'my_order'
require 'customer'

RSpec.describe MyOrder do

  let(:default_phone_number) { 'ENV' }

  describe 'can store order details' do
    context 'when order is placed' do

      it 'LIVE: sees MyOrder has indeed stored order on live test' do
        default_customer = Customer.new
        my_order = default_customer.live_restaurant.customer_order
        default_customer.make_selection
        expect(my_order.store_order).to eq [{ :Name => "Tikka_Masala", :Price => 5 }, { :Name => "Naan", :Price => 2 }]
      end

      it 'LIVE: stores customer phone number with order' do
        default_customer = Customer.new
        my_order = default_customer.live_restaurant.customer_order
        default_customer.make_selection
        expect(my_order.customer_phone_number).to eq default_phone_number
      end
    end
  end

end
