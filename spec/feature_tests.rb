# irb require './spec/feature_tests.rb'
require './lib/menu'
require './lib/customer_order'
require './lib/bill'
require './lib/text'

@menu = [{dish: 'Hawaiian' , price: '8.99'},
  {dish: 'BBQ Original', price: '6.99'},
  {dish: 'Vegeterian', price: '7.99'},
  {dish: 'Four Seasons', price: '5.99'},
  {dish: 'Seafood' , price: '8.99'},
  {dish: 'Margerita' , price: '4.99'},
  {dish: 'Ceasar Salad' , price: '5.90'}
 ]

@order_1 = {dish:'Hawaiian', quantity: 2}
@order_2 = {dish:'Seafood', quantity: 4}

def typical_order
  menu = Menu.new(@menu)
  bill = Bill.new
  text = Text.new
  menu.printed
  order = CustomerOrder.new(menu, bill, text)
  order.select_dish(@order_1[:dish], @order_1[:quantity])
  order.select_dish(@order_2[:dish], @order_2[:quantity])
  order.total
  order.process(53.94)
end

def payment_not_validated
  menu = Menu.new(@menu)
  bill = Bill.new
  text = Text.new
  menu.printed
  order = CustomerOrder.new(menu, bill, text)
  order.select_dish(@order_1[:dish], @order_1[:quantity])
  order.select_dish(@order_2[:dish], @order_2[:quantity])
  order.process(50)
end

def order_not_valid_menu_item
  menu = Menu.new(@menu)
  bill = Bill.new
  text = Text.new
  menu.printed
  order = CustomerOrder.new(menu, bill, text)
  order.select_dish('Tortellini', @order_1[:quantity])
  order.select_dish(@order_2[:dish], @order_2[:quantity])
  order.process(53.94)
end

def order_not_valid_item
  menu = Menu.new(@menu)
  bill = Bill.new
  text = Text.new
  menu.printed
  order = CustomerOrder.new(menu, bill, text)
  order.select_dish(@order_1[:dish], 'wrong')
  order.select_dish(@order_2[:dish], @order_2[:quantity])
  order.process(53.94)
end
