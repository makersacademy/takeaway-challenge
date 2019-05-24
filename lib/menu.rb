require 'csv'
require './lib/dish'

class Menu
  attr_reader :items, :item_class
  def initialize(items = [], item_class = Dish)
    @items = items
    @item_class = item_class
  end

  def view_items
    to_return = ""
    items.each do |item|
      to_return += item.formatted + " "
    end
    to_return
  end

  def load_items(file)
    menu_data = CSV.read(file)
    menu_data.drop(1).map{|dish|
      items.push(item_class.new(dish[0], dish[1]))
    }
  end
end
