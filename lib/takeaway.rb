require_relative 'order'
require_relative 'dish'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new.items
    @order = Order.new
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name} -- £#{dish.price}"
    end
  end

  # def create_order
  #   @order = Order.new
  # end

  def add_item_to_order(add_dish)
    # order = create_order
    menu.each do |dish|
      if dish.name == add_dish
        order.items << dish
        order.total_cost += dish.price
      end
    end
  end

  def order_total
    order.total_cost
  end

end
