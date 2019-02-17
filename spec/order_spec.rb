require 'order.rb'
describe Order do
  let (:message_sender_double) { double :message_sender, send_message: nil  }
  it 'gets created with order items, quantity, order total price, delivery address and contact phone number' do
    basket_item_double = double :basket_item
    another_basket_item_double = double :basket_item
    basket_double = double :basket, basket_items: [basket_item_double, another_basket_item_double], basket_total_price: 58.00
    customer_address_double = double :customer_address
    customer_phone_number_double = double :phone
    order = Order.new(basket_double.basket_items, basket_double.basket_total_price, customer_address_double, customer_phone_number_double, message_sender_double)
    expect(order.order_items).to equal (basket_double.basket_items)
    expect(order.order_total_price).to equal (basket_double.basket_total_price)
    expect(order.delivery_address).to equal (customer_address_double)
    expect(order.contact_phone).to equal (customer_phone_number_double)

  end
  it 'returns order summary when requested' do
    basket_item_double = double :basket_item
    another_basket_item_double = double :basket_item
    basket_double = double :basket, basket_items: [basket_item_double, another_basket_item_double], basket_total_price: 58.00
    customer_address_double = double :customer_address
    customer_phone_number_double = double :phone
    order = Order.new(basket_double.basket_items, basket_double.basket_total_price, customer_address_double, customer_phone_number_double, message_sender_double)
    expect(order.summary).to equal order
  end

  it 'returns the delivery time for an order' do
    basket_item_double = double :basket_item
    another_basket_item_double = double :basket_item
    basket_double = double :basket, basket_items: [basket_item_double, another_basket_item_double], basket_total_price: 58.00
    customer_address_double = double :customer_address
    customer_phone_number_double = double :phone
    order = Order.new(basket_double.basket_items, basket_double.basket_total_price, customer_address_double, customer_phone_number_double, message_sender_double)
    expect(order.delivery_time).to eq (Time.now + 3600).strftime("%F:%H:%M:%S")
  end

  it 'sends a confirmation sms text to customers contact number when confirmed' do
    basket_item_double = double :basket_item
    another_basket_item_double = double :basket_item
    basket_double = double :basket, basket_items: [basket_item_double, another_basket_item_double], basket_total_price: 58.00
    customer_address_double = double :customer_address
    customer_phone_number_double = double :phone
    delivery_time_double = double :delivery_time
    order = Order.new(basket_double.basket_items, basket_double.basket_total_price, customer_address_double, customer_phone_number_double, message_sender_double)
    allow(order).to receive_messages(:delivery_time => delivery_time_double)
    order.confirm
    expect(message_sender_double).to have_received(:send_message).with(customer_phone_number_double, delivery_time_double)
  end


end
