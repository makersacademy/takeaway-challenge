#allows customer to place an order

require './lib/order.rb'
require './lib/sms.rb'

class Takeaway

attr_reader :view_menu, :order, :placed_order

  ALL_DISHES = {1 => {"Chicken Adobo" => 4.50},
  2 => {"Pancit Bihon" => 4.50},
  3 => {"Pancit Canton" => 4.50},
  4 => {"Sizziling Pork Sisig" => 5.00},
  5 => {"Pork Sinigang" => 5.00},
  6 => {"Sizziling Beef Sisig" => 4.50},
  7 => {"Stir Fried Vegetables" => 3.50},
  8 => {"Rice and Lechon" => 5.50}
  }

  def initialize(order_klass)
    @view_menu = ALL_DISHES
    @order = order_klass
  end

  def select(dish_number, quantity)
    place_new_order if placed_order == nil
    raise "Sorry, please pick an available dish option (1-8)" if view_menu[dish_number] == nil
    quantity.times {placed_order.selected_dishes << view_menu[dish_number]}
  end

  def check_order
    check_for_error
    placed_order.view_order
  end

  def total_cost
    check_for_error
    placed_order.total_cost
  end

  def confirm_order
    check_for_error
    SMS.send_message
  end

private

  def check_for_error
    raise "No order has been made." if placed_order == nil
  end

  def placed_order
    @placed_order
  end

  def place_new_order
    @placed_order = order.new
  end

end
