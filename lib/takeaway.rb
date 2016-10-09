require "csv"
require_relative 'dish_list'
require_relative 'dish'
require_relative 'order'

class Takeaway

  attr_reader :dish_list, :order

  def initialize( args = {dish_list: DishList.new(Dish), order: Order.new} )
    @dish_list = args[:dish_list]
    @order     = args[:order]
  end

  def load_dishes(filename)
    if File.exist?(filename)
      CSV.foreach(filename) { |data| dish_list.add_dish(data) }
    else
      "File '#{filename}' not found!"
    end
  end

  def menu
    puts dish_list
  end

  def add_dish(id, qty=1)
    fail_if_wrong_id(id)
    fail_if_wrong_qty(qty)
    dish = dish_list.select_dish(id)
    order.add_item(dish, qty)
  end

  def remove_dish(id, qty=1)
    fail_if_wrong_id(id)
    fail_if_wrong_qty(qty)
    dish = dish_list.select_dish(id)
    order.remove_item(dish, qty)
  end

  def order_total
    order.total
  end

  private

  def fail_if_wrong_id(id)
    max = dish_list.dishes.count
    fail "Wrong ID! Please, select dishes from 1 to #{max}" unless (1..max).include?(id)
  end

  def fail_if_wrong_qty(qty)
    fail "Wrong quantity! Quantity should be 1 or more" if qty < 1
  end
end
