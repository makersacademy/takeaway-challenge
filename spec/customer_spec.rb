require 'customer'

describe Customer do
  subject(:customer) { described_class.new }

    describe '#display_menu'
      it 'displays a menu to customer' do
        expect(customer).to respond_to(:display_menu).with(1).argument
      end

    describe '#place_order'   
      it 'allows customer to place an order' do
        expect(customer).to respond_to(:place_order).with(1).argument
      end
end
