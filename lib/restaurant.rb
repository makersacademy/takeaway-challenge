require_relative 'messenger'
class Restaurant
  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = Hash.new(0)
    @menu = menu
  end

  def see_menu
    @menu.load_menu_from_file
    @menu.change_menu_to_string
  end

  def submit_order(new_order)
    @order << new_order
    Messenger.send(get_order_confirmation_message)
  end

  def get_order_confirmation_message
    t = Time.new
    t += 60 * 60
    "Thank you! Your order was placed and will be delivered before " + t.strftime("%R")
  end

  def add_dish_to_orders(dish_index)

    dish = menu.dishes[dish_index - 1]
    @order[dish] += 1
  end

  def add_order_total
    @order.map do |dish, quantity|
      dish.price.to_f * quantity.to_f
   end.inject(:+)

  end




end
