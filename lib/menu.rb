require_relative 'takeaway'
require_relative 'order'

class Menu

  attr_accessor :menu_items

  def initialize
    @menu_items = { "spring roll" => 0.99, "char sui bun" => 3.99, "pork dumpling" => 2.99, "peking duck" => 7.99, "fu-king fried rice" => 5.99 }
  end

  def add_item(item, price)
    menu_items[item] = price
  end

  def includes_dish?(dish)
    !!menu_items[dish]
  end

  def price(dish)
    menu_items[dish]
  end
end
