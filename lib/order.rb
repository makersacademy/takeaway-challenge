require_relative 'menu'

class Order
  attr_reader :take_order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @take_order = []
  end

  def customer_order(item, amount)
    @take_order << { item: item, amount: amount }
  end

  def total_cost
    total = 0

    @take_order.each do |food_item|
      total += @menu.menu_items[food_item[:item]] * food_item[:amount]
    end
    total
  end

end
