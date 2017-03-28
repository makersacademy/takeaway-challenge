class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new.dishes
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name}: £#{dish.price}"
    end
  end

  def new_order
    @order = Order.new
  end

  def add_to_order(dish_to_add)
    order = new_order
    menu.each do |dish|
      if dish.name == dish_to_add
        order.items << dish
      end
    end
  end

end
