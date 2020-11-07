require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = []
  end

  def view_menu
    @menu.view
  end

  def add(item, quantity = 1)
    raise "Please enter a item on the menu" if check_item(item) == false
    @order << {Item: item, Quantity: quantity, Price: @menu.falafel_menu.fetch(item)}
  end

  def check_item(item)
    @menu.falafel_menu.key?(item)
  end

  def total
    (@order.map { |h| h[:Price] * h[:Quantity]}).inject(:+)
    print_order
  end

  private

  def print_order
    header
    @order.each do |element|
      puts "-------------------------"
      element.each do |key, value|
        pp "#{key}: #{value} "
      end
    end
    puts "-------------------------"
  end

  def header
    puts "-------------------------"
    puts "Order Summary".center(25)
    puts "-------------------------"
  end

end