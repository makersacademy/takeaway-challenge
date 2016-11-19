require './lib/order.rb'

#allows customer to place an order
class Takeaway

attr_reader :all_dishes, :placed_order, :order

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
    @all_dishes = ALL_DISHES
    @order = order_klass
    @placed_order = nil
  end

  def view_menu
    all_dishes
  end

  def select(dish_number, quantity)
    raise "Sorry, please pick an available dish option (1-8)" if all_dishes[dish_number] == nil
    raise "You have not generated a new order to add to yet." if placed_order == nil
    quantity.times {placed_order.selected_dishes << all_dishes[dish_number]}
  end

  def place_new_order
    @placed_order = order.new
  end

  def check_order
    raise "No order has been made." if placed_order == nil
    placed_order.view_order
  end

  def total_cost
    placed_order.total_cost
  end




end
