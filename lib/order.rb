require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
  end

  def add(item, quantity)
    # puts "what do you want to order?"
    # wants = gets.chomp.to_s
    @order << wants
  end

  def checkout(order)
    @order << @menu.price
  end

end
