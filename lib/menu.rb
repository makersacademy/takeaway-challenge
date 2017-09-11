require 'twilio-ruby'
require_relative 'order'

class Menu
  attr_reader :balance, :current_order, :basket

  def initialize
    @order = Order.new
    @menu_items = { rice: 1, curry: 5, chips: 2, garlicbread: 4 }
  end

  def main_menu
    puts
    puts "---- MAKERS EXPRESS ----".center(70)
    puts "1. Rice - £1.00".center(70)
    puts "2. Curry - £5.00".center(70)
    puts "3. Chips - £2.00".center(70)
    puts "4. Garlic Bread - £4.00".center(70)
    puts "---------------------------".center(70)
    puts "5. CHECK BASKET".center(70)
    puts "6. CHECK CURRENT ORDER".center(70)
    puts "7. CHECK OUT".center(70)
    return "Make Your Order!"
  end

  def get_order(order_choice, quantity = 0)
    case order_choice
    when 1
      @order.choice("Rice")
      @order.item_quantity(quantity)
      @order.price(@menu_items[:rice])
      send_to_basket
    when 2
      @order.choice("Curry")
      @order.item_quantity(quantity)
      @order.price(@menu_items[:curry])
      send_to_basket
    when 3
      @order.choice("Chips")
      @order.item_quantity(quantity)
      @order.price(@menu_items[:chips])
      send_to_basket
    when 4
      @order.choice("Garlic Bread")
      @order.item_quantity(quantity)
      @order.price(@menu_items[:garlicbread])
      send_to_basket
    when 5
      if @order.basket == []
        puts "Your basket is empty"
      else
        puts "Your current basket"
        return @order.basket
      end
    when 6
      @order.current_order
    when 7
      exit
    else
      puts "Not on Menu, try again"
    end
  end

  def send_to_basket
    @order.add_to_current_order
    @order.add_to_basket
  end

  def checkout(total_to_pay)
    sum = total_to_pay
    if sum != @order.total
      return "wrong total try again"
    else
      @order.checkout
    end
  end
end
