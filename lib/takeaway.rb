class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new.dishes
    @order = Order.new
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name}: £#{dish.price}"
    end
  end

  def add_to_order(dish_to_add)
    menu.each do |dish|
      if dish.name == dish_to_add
      order.items << dish and
        sum_total(dish)
      end 
    end
  end

  def sum_total(dish)
    order.total += dish.price
  end

end
