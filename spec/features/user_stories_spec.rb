require_relative '../spec_helper'

describe 'takeaway' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customers can select their order, display a list of dishes' do
    order = Order.new
    expect(order.view_menu).to eq(Menu::LIST_OF_DISHES)
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so we can order multiple dishes, select and store each dish chosen' do
    order = Order.new
    order.view_menu
    order.add_dish('Chicken Chow Mein')
    order.add_dish('Spicy Chilli Beef')
    order.add_dish('Egg Fried Rice', 'Diet Coke')
    expect{ order.add_dish('Kung Pow Chicken') }.to change{ order.in_basket }.to eq([
       'Chicken Chow Mein',
       'Spicy Chilli Beef',
       'Egg Fried Rice',
       'Diet Coke',
       'Kung Pow Chicken'
       ])
  end

  describe 'receipt' do
    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been given matches the sum of the various dishes in my order
    it 'so I can verify an order, returns a total for the dishes in the current order' do
      order = Order.new
      checkout = Checkout.new
      order.view_menu
      order.add_dish('Chicken Chow Mein')
      order.add_dish('Spicy Chilli Beef')
      expect(checkout.total_cost(order)).to eq(10.50)
    end

    it 'so I can check the total individual prices, print an itemised receipt' do
      order = Order.new
      checkout = Checkout.new
      order.view_menu
      order.add_dish('Chicken Chow Mein')
      order.add_dish('Spicy Chilli Beef')
      receipt_message = "Order:\n1.Chicken Chow Mein - £5.5\n2.Spicy Chilli Beef - £5.0\nTotal - £10.5"
      expect(checkout.itemised_receipt(order)).to eq(receipt_message)
    end
  end
  describe 'text confirmation' do
    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    it 'sends a text, to confirm the order and specify time of delivery' do
      order = Order.new
      messenger = Messenger.new
      order.add_dish('Chicken Chow Mein')
      order.add_dish('Spicy Chilli Beef')
      expect{ messenger.send_confirmation_sms(order) }.not_to raise_error
    end
  end
end
