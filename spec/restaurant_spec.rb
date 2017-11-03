require 'restaurant'
require 'twilio-ruby'

RSpec.describe Restaurant do

  let(:default_phone_number) { 'ENV' }

  describe 'can interact with customer' do
    context 'before placing an order' do
      it 'sends a menu to a mock customer' do
        fake_customer = double :customer
        restaurant = Restaurant.new
        menu = [{ :Name => 'Tikka_Masala', :Price => 5 }, { :Name => 'Naan', :Price => 2 }, { :Name => 'Rice', :Price => 2 }]
        allow(fake_customer).to receive(:request_menu).and_return(menu)
        expect(restaurant.the_menu).to eq fake_customer.request_menu(menu)
      end

    end

    context 'when customer places order' do

      it 'processes customer order correctly' do
        user_selection = ['Tikka_Masala', 'Naan', 'Non-Existent-Item']
        what_order_should_interpret_that_as = [{ :Name => "Tikka_Masala", :Price => 5 }, { :Name => "Naan", :Price => 2 }]

        restaurant = Restaurant.new

        restaurant.input_selection default_phone_number, user_selection
        expect(restaurant.send_to_order).to eq what_order_should_interpret_that_as
      end

      it 'LIVE: receives specific selection and creates confirmation for customer' do
        restaurant = Restaurant.new

        order_confirm = "You have selected Tikka_Masala & Naan"
        user_selection = ['Tikka_Masala', 'Naan', 'Non-Existent-Item']

        expect(restaurant.confirm_selection default_phone_number, user_selection).to eq order_confirm
      end

      it 'receives confirmation that order comes in an hour' do
        restaurant = Restaurant.new
        time = Time.new(2017, 9, 10, 21, 0, 0)
        allow(Time).to receive(:new).and_return(time)
        expect(restaurant.confirm_order_text).to eq "Thank you - your order will arrive at 2017-09-10 22:00:00 +0100"
      end

      it 'expects a text to be sent to customer when they confirm order' do

        test_sid = 'ENV'
        test_token = 'ENV'
        test_restaurant_number = '+ENV'
        test_customer_number = '+ENV'

        restaurant = Restaurant.new
        test_interface = TwilioInterface.new(test_sid, test_token)
        customer_order = double :my_order
        time = Time.new(2017, 9, 10, 21, 0, 0)

        allow(Time).to receive(:new).and_return(time)
        allow(customer_order).to receive(:customer_phone_number).and_return(test_customer_number)
        allow(restaurant).to receive(:twilio_interface).and_return(test_interface)

        expect(restaurant.send_confirmation_text test_restaurant_number, customer_order.customer_phone_number).to eq "Sent from your Twilio trial account - Thank you - your order will arrive at 2017-09-10 22:00:00 +0100"
      end

    end

  end

end
