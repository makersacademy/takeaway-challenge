require 'takeaway.rb'
describe Takeaway do
  let(:a_dish_double) { double :dish, name: "Pizza", price: 10.00 }
  let(:another_dish_double) { double :dish }
  let(:dish_class_double) { double :dish_class, new: a_dish_double }
  let(:menu_double) { double :menu, dishes: [a_dish_double, another_dish_double], select_dish: a_dish_double }
  let(:menu_class_double) { double :menu_class, new: menu_double }
  let(:basket_double) { double :basket, add_item: nil }
  let(:basket_item_double) { double :basket_item }
  let(:another_basket_item_double) { double :basket_item }
  let(:another_basket_double) { double :basket, basket_items: [basket_item_double, another_basket_item_double], basket_total_price: 58.00 }
  let(:customer_address_double) { double :customer_address }
  let(:customer_phone_number_double) { double :phone }
  let(:customer_double) { double :customer, name: "Sally", address: customer_address_double, phone_number: customer_phone_number_double }
  let(:message_double) { double :message }
  let(:message_sender_double) { double :message_sender, send_message: nil }
  let(:message_sender_class_double) { double :message_sender_class, new: message_sender_double }
  let(:delivery_time_double) { double :delivery_time }
  let(:order_double) { double :order, confirm: message_double, delivery_time: delivery_time_double }
  let(:order_class_double) { double :order_class, new: order_double }

  it 'creates a menu with a list of dishes' do
    dish_list = [a_dish_double, another_dish_double]
    takeaway = Takeaway.new(menu_class_double, dish_class_double, basket_double, message_sender_class_double, order_class_double, customer_double)
    expect(takeaway.create_menu(dish_list)).to equal menu_double
  end

  it 'creates a dish' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, basket_double, message_sender_class_double, order_class_double, customer_double)
    expect(takeaway.create_dish("Pizza", 10.00)).to equal a_dish_double
  end

  it 'gets created with a basket' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, basket_double, message_sender_class_double, order_class_double, customer_double)
    expect(takeaway.basket).to equal basket_double
  end

  it 'gets created with a customer' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, basket_double, message_sender_class_double, order_class_double, customer_double)
    expect(takeaway.customer).to equal customer_double
  end

  it 'gets created with a message sender' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, basket_double, message_sender_class_double, order_class_double, customer_double)
    expect(takeaway.message_sender).to equal message_sender_double
  end

  it 'adds a basket item to basket' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, basket_double, message_sender_class_double, order_class_double, customer_double)
    dish_list = [a_dish_double, another_dish_double]
    expect(takeaway.create_menu(dish_list)).to equal menu_double
    takeaway.select_item_to_buy(a_dish_double)
    expect(takeaway.menu).to have_received(:select_dish).with(a_dish_double)
    expect(takeaway.basket).to have_received(:add_item).with(a_dish_double)
  end

  it 'creates an order' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, another_basket_double, message_sender_class_double, order_class_double, customer_double)
    expect(takeaway.create_order).to equal order_double
    expect(takeaway.order_class).to have_received(:new).with(another_basket_double.basket_items, another_basket_double.basket_total_price, customer_address_double, customer_phone_number_double, message_sender_double)
  end

  it 'confirms an order' do
    takeaway = Takeaway.new(menu_class_double, dish_class_double, another_basket_double, message_sender_class_double, order_class_double, customer_double)
    takeaway.create_order
    takeaway.confirm_order
    expect(takeaway.order).to have_received(:confirm)
  end

end
