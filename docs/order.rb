require './docs/menu' 
require './docs/SMS'
require 'rubygems'

class Order

  attr_reader :current_order

  def initialize
    @current_order = []
    @new_menu = Menu.new
    @order_price = 0
  end

  def add_to_basket(dish, quantity)
    raise "Item not on the menu" unless @new_menu.menu.has_key?(dish)
    quantity.times { @current_order << dish }
  end

  def calculate_price
    price = 0

    @current_order.each do |dish| 
      if @new_menu.menu.has_key?(dish)
        price += @new_menu.menu.fetch(dish)
      end
    end
    @order_price + price
  end

  def complete_order(phone_number)
    SMS.new.send_sms(phone_number)
  end

end
