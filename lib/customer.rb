require_relative 'menu.rb'

class Customer

  attr_reader :order

  def initialize
    @order = []
  end

  def display_menu
    menu = Menu.new
    menu.dishes.each do | dish, price |
      "#{ dish }: £#{ price }"
    end
  end

  def add_to_order(dish, quantity)
    to_add = {dish:dish, quantity:quantity}
    @order << to_add
  end

  def review_order
    @order
  end

  def price_of_order
  end

end

