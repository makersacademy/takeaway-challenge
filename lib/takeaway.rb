require_relative 'menu'

class TakeAway
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
  end

  def read_menu
    @menu.display_menu
  end

  def order_food(food, quantity)
    @order[food] = quantity
    "#{quantity} order(s) of #{food} added to your cart"
  end

  def order_summary
    summary = []
    @order.each do |food, quantity|
      price = @menu.display_menu[food] * quantity
      summary << "#{food} x #{quantity} = $#{price}"
    end
    summary.join ', '
  end

  def total
    total = 0
    @order.each{|food, quantity| total += @menu.display_menu[food] * quantity}
    total
  end
end
