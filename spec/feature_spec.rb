require 'menu'
require 'dish'
require 'order'
require 'twilio-ruby'

describe 'takeaway features' do
  let(:dishes) { [
    Dish.new(name: 'Vegan Mixed Grill', price: 5.5),
    Dish.new(name: 'Sweet Potato Fries', price: 6.50),
    Dish.new(name: 'Vegan Burger', price: 7.50)
  ]
  }
  let(:menu) { Menu.new(dishes) }
  let(:message_response_double) { double(:response, error_code: nil) }
  let(:message_double) { double(:message, create: message_response_double) }
  let(:text_message_client_double) { double(:client, messages: message_double) }
  let(:text_message_client_class_double) { double(:client, new: text_message_client_double) }
  let(:order) { Order.new(text_message_client_class: text_message_client_class_double) }

  it 'can list all dishes with their prices' do
    expect(menu.list_dishes).to eq("1. Vegan Mixed Grill - £5.50\n2. Sweet Potato Fries - £6.50\n3. Vegan Burger - £7.50") 
  end

  it 'can add dishes to order and check the price of the order' do
    order.add_dishes_to_order(menu, 1, 2, 3)
    expect(order.check_order).to eq("Vegan Mixed Grill - £5.50\nSweet Potato Fries - £6.50\nVegan Burger - £7.50\nTOTAL: £19.50")
  end

  it 'sends a text to confirm order submission and delivery time' do
    order.add_dishes_to_order(menu, 1, 2)
    expect(order.submit_order('555-555-5555')).to be_truthy
  end
end
