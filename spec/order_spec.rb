require 'order.rb'
describe Order do
  it 'gets created with order items, quantity, order total price, delivery address and contact phone number' do
    basket_item_double = double :basket_item
    another_basket_item_double = double :basket_item
    basket_double = double :basket, basket_items: [basket_item_double, another_basket_item_double], basket_total_price: 58.00
    customer_address_double = double :customer_address
    customer_phone_number_double = double :phone
    order = Order.new(basket_double.basket_items, basket_double.basket_total_price, customer_address_double, customer_phone_number_double)
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
    order = Order.new(basket_double.basket_items, basket_double.basket_total_price, customer_address_double, customer_phone_number_double)
    expect(order.summary).to equal order
  end


end
