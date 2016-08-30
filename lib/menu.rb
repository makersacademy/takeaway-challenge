require_relative 'dish'

class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {}
  end

  def add_dish(dish)
    @menu_items[dish.name] = dish.price
  end

  def print_menu
    @menu_items.each do |item, price|
      puts "#{item} - £#{price}"
    end
  end
end
