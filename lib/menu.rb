require 'order'

class Menu

attr_reader :order

def initialize
  @info = { Satay: 5, RotiCanai: 9, Kuih: 3, NasiLemak: 10}
  @order = Order.new

end

def read_menu
  puts "Malaysian Express - Authentic Malaysian"
  puts "1. Satay - $5.00"
  puts "2. RotiCanai - $9.00"
  puts "3. Kuih - $3.00"
  puts "4. Nasi Lemak - $10"
  puts "5. Check Basket"
  return "Choose Option for your order! (Input a Number)"
end

def menu_functions(order_option,quantity = 0)
  @quantity = quantity
  case order_option
   when 1
    @order.option("Satay")
    @order.food_quantity(quantity)
    @order.price(@info[:Satay])
    update
  when 2
    @order.option("RotiCanai")
    @order.food_quantity(quantity)
    @order.price(@info[:RotiCanai])
    update
  when 3
    @order.option("Kuih")
    @order.food_quantity(quantity)
    @order.price(@info[:Kuih])
    update
  when 4
    @order.option("Nasi Lemak")
    @order.food_quantity(quantity)
    @order.price(@info[:NasiLemak])
    update
  when 5
    update
  end
end

def update
  @order.update_order
end


def check_basket
  basket = @basket
  basket.each do |element,number|
    puts "#{number}x #{element}"
  end
end

def adding_food
  @current_order[:food] = @option
  @current_order[:quantity] = @quantity
  @basket << @current_order.values
end





end
