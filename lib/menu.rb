require_relative 'order'

class Menu

attr_reader :order, :info

def initialize
  @info = { Satay: 5, RotiCanai: 9, Kuih: 3, NasiLemak: 10}
  @order = Order.new

end

def read_menu
  puts "Malaysian Express - Authentic Malaysian"
  puts "Add your foods by selecting them, the rest explains itself"
  puts "1. Satay - $5.00"
  puts "2. RotiCanai - $9.00"
  puts "3. Kuih - $3.00"
  puts "4. Nasi Lemak - $10"
  puts "5. Check Basket"
  puts "6. Erase Order from Basket"
  puts "7. Checkout"
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
    if @order.basket == []
      puts "Basket is currently empty"
    else
    return @order.basket
    end
  when 7
    order.total
  end
end

def update
   @order.update_order
   @order.update_basket
end

def check_out(money)
  if money < @order.total_price
     puts "Sorry, wrong amount for payment."
   elsif money > @order.total_price
     change = money - @order.total_price
     puts "Here's your change! $#{change}! You'll hear a confirmation soon!"
  else
     puts "Perfect! You'll hear a confirmaton soon!"
  end
end

end
