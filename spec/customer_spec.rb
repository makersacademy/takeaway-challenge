require 'customer'

RSpec.describe Customer do

  let(:default_phone_number) { 'ENV' }

  describe 'is initialised' do
    context 'when just a default customer' do
      it 'creates a customer with default phone number' do
        default_customer = Customer.new
        expect(default_customer.phone_number).to eq default_phone_number
      end
    end
  end

  describe 'interacts with restaurant' do
    context 'before placing an order' do
      it 'asks to see the menu w/ double' do
        default_customer = Customer.new
        fake_restaurant = double :restaurant
        allow(fake_restaurant).to receive(:the_menu).and_return("The Menu")
        expect(default_customer.request_menu fake_restaurant).to eq "The Menu"
      end
    end

    context 'when placing an order' do

      it 'LIVE: confirms order total from restaurant' do
        default_customer = Customer.new
        default_customer.make_selection
        expect(default_customer.confirm_total).to eq 7
      end

      it 'LIVE: confirms order total from restaurant with 3 naans' do
        default_customer = Customer.new
        default_customer.make_selection(default_phone_number, ['Naan', 'Naan', 'Naan'])
        expect(default_customer.confirm_total).to eq 6
      end

    end


  end

end
