require './lib/food_list.rb'
require 'money'

class Order
  include FoodList

  def show_total
    Money.new(items.inject(0) { |sum, item| sum + item.price }, "GBP").format
  end

  def add_item(item)
    items.push(item)
  end
end
