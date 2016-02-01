require 'takeaway'
require 'menu'
require 'twilio-ruby'

  describe 'Feature Tests' do
    subject (:takeaway) { Takeaway.new(Menu.new, Twilio::REST::Client.new("0", "0")) }

    it 'allows the customer to view the available dishes with prices' do
      # As a customer
      # So that I can check if I want to order something
      # I would like to see a list of dishes with prices
      expect(takeaway.show_menu).to include("Mixed Kebab")
    end

    it 'allows the customer to select from the available dishes' do
      # As a customer
      # So that I can order the meal I want
      # I would like to be able to select some number of several available dishes
      takeaway.add("Mixed Kebab")
      expect(takeaway.order.current_order).to include("Mixed Kebab")
    end

    it 'allows the customer to view their order and total price' do
      #As a customer
      # So that I can verify that my order is correct
      # I would like to check that the total I have been given matches the sum of the various dishes in my order
      expect{ takeaway.add("Coke") }.to change{ takeaway.order.total }.by 1
    end

    it 'sends the customer an order confirmation via text message' do
      # As a customer
      # So that I am reassured that my order will be delivered on time
      # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
      allow(takeaway).to receive(:send_text_confirmation)
      takeaway.add("Coke", 5)
      takeaway.checkout(5)
      expect(takeaway.order.total).to eq 0
    end
  end
