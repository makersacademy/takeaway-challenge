require "./lib/menu.rb"

class Takeaway

  def initialize(name: name = "HealthyFoods", menu: menu = Menu.new, order: order = Order.new)
    @name = name
    @menu = menu
    @order = order
  end

  def publish_menu
    @menu.publish_menu
  end

  def select_dish(name, quantity = 1)
    raise "Not in menu" unless @menu.check_item_in_menu(name)
    @order.add_dish_to_order(@menu.get_dish(name), quantity)
    puts "added #{name} for #{quantity} to the order"
  end

  def publish_order
    @order.publish_order
  end

  def confirm_order
    @order.confirm_order
  end

  def show_all_orders
    @order.show_all_orders
  end

end
