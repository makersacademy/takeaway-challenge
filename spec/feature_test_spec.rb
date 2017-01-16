require 'take_away'

describe 'Feature tests for User Stories' do

  context 'User Story 1' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'customer can see the list of dishes with prices' do
      take_away = TakeAway.new
      take_away.read_menu
      expect { take_away.read_menu }.to output.to_stdout
    end
  end

  context 'User Story 2' do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    let (:message) { instance_double "SMS" }
    let (:order_hash) { { 1 => 3, 6 => 2, 9 => 1} }
    it 'customer can place an order with selected number of items' do
      take_away = TakeAway.new
      allow(take_away).to receive(:send_sms)
      total = take_away.place_order(order_hash)
      expect(total).to eq(85)
    end
  end

  context 'User Story 3' do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    let (:message) { instance_double "SMS" }
    let (:order_hash) { { 1 => 3, 6 => 2, 9 => 1} }
    it 'customer can see details of the order with prices' do
      take_away = TakeAway.new
      allow(take_away).to receive(:send_sms)
      take_away.place_order(order_hash)
      take_away.order_details
      expect { take_away.order_details }.to output.to_stdout
    end
  end

  context 'User Story 4' do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order for the total amount if $[x] was placed and will be delivered before 18:52" after I have ordered
    let (:order_hash) { { 1 => 3, 6 => 2, 9 => 1} }
    it 'when order send customer recieves a text message with time and order total amount' do
      take_away = TakeAway.new
      allow(take_away).to receive(:send_sms)
      take_away.place_order(order_hash)
      message = "Thank you! Your order for the total amount if $85 was placed and will be delivered before 18:52"
      # expect { customer }.to receive_a(text_message) on his phone
    end
  end
end
