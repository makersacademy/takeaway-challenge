require_relative 'menu'

class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def menu
    Menu.each { |item, price| puts "#{item}: £#{price}" }
  end

  def add_item(food, quantity = 1)
    quantity.times { @order << food }
  end



end