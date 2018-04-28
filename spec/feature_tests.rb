# irb require './spec/feature_tests.rb'

require './lib/dishes'
require './lib/customer_order'

@menu = [{dish: 'Hawaiian' , price: '8.99'},
  {dish: 'BBQ Original', price: '6.99'},
  {dish: 'Vegeterian', price: '7.99'},
  {dish: 'Four Seasons', price: '5.99'},
  {dish: 'Seafood' , price: '8.99'},
  {dish: 'Margerita' , price: '4.99'},
  {dish: 'Ceasar Salad' , price: '5.90'}
 ]

@order_1 = ['Hawaiian', 2]
@order_2 = ['Tortellini', 3]

def print_list
  dishes = Dishes.new(@menu)
  dishes.print
end

def order
  p dishes = Dishes.new(@menu)
  p order = CustomerOrder.new(dishes)
  p order.select_dish(@order_1[0], @order_1[1])
  p order.select_dish(@order_2[0], @order_2[1])
end
