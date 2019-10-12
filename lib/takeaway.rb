require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

  include OrderSMS
  attr_reader :order_list, :order

  def initialize(menu = Menu)
    @order_list = []
    @menu = menu.new
  end

  def view_menu
    @menu.view_menu
  end

  def new_order(order = Order)
    puts "What is your name for the order?"
    name = gets.chomp
    puts "What is the number for the order?"
    number = gets.chomp.to_s
    @order = order.new(name, number)
  end

  def add_items
    puts "Hi #{@order.customer.capitalize}! What is the first item for the order?"
    item = gets.chomp
    puts "How many of this item?"
    quantity = gets.chomp.to_i
    while item != ""
      @order.add(item, quantity) if quantity > 0
      puts "What is the next item?"
      item = gets.chomp
      if item != ""
        puts "How many of this item?"
        quantity = gets.chomp.to_i
      end
    end
    @order_list << @order
  end

  def order_total
    @order.calc_total(@menu.dishes)
  end

  def deliver
    sms
  end

end
