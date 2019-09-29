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
    puts "What is the name for the order?"
    name = gets.chomp
    puts "What is the number for the order?"
    number = gets.chomp.to_s
    @order = order.new(name, number)
    add_item
    @order.calc_total(@menu.dishes)
    # sms
  end

  def add_item
    puts "Hi #{@order.customer.capitalize}! What is the first item for the order?"
    item = gets.chomp
    puts "How many of this item?"
    quantity = gets.chomp.to_i
    while item != ""
      @order.add(item, quantity) if item != "" && quantity.is_a? Integer
      puts "What is the next item?"
      item = gets.chomp
      if item != ""
        puts "How many of this item?"
        quantity = gets.chomp.to_i
      end
    end
    @order_list << @order
  end

end
