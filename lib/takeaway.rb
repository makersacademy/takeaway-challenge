require "csv"
require_relative 'dish_list'
require_relative 'dish'

class Takeaway

  attr_reader :dish_list

  def initialize(dish_list = DishList.new(Dish))
    @dish_list = dish_list
  end

  def load_dishes(filename)
    if File.exist?(filename)
      CSV.foreach(filename) { |data| dish_list.add_dish(data) }
    else
      "File '#{filename}' not found!"
    end
  end
end
