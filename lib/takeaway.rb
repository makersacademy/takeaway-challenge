require_relative 'menu'

class TakeAway
  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Hash.new(0)
  end

  def view_menu
    menu.print
  end

  def add_to_order(dish, amount = 1)
    raise "Cannot add to order: dish doesn't exist" unless exist?(dish)
    order[dish] = amount
  end

  def view_order
    @order.map do |dish, amount|
      p "#{amount}x #{dish}: £#{price(dish) * amount}"
    end
  end

  def price(dish)
    menu.price(dish)
  end

  private

  def exist?(dish)
    menu.dishes.include?(dish)
  end




end
