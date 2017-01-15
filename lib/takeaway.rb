require_relative 'menu'

class TakeAway

  def initialize
    @menu = Menu.new
    @order = []
  end

  def view_menu
    menu.items
  end

  def add_to_order(dish, amount = 1)
    raise "Cannot add to order: that dish is not on the menu" unless dish_exist?(dish)
    amount.times {order << dish}
    "#{amount} #{dish} added to order"
  end

  # def view_order
  #   order.each do |item|
  #     @basket << { item => (order.count(item)) }
  #   end
  #   basket.uniq
  # end

  private
  attr_reader :menu, :order

  def dish_exist?(dish)
    view_menu.any? {|hash| hash[dish]}
  end

end
