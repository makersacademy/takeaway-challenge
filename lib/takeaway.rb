require "csv"
require_relative 'dish_list'
require_relative 'dish'

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

  def add_dish(id)
    dish = dish_list.select_dish(id)
    order.add_item(dish)
  end

  def remove_dish(id)
    dish = dish_list.select_dish(id)
    order.remove_item(dish)
  end
end
