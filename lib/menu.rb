require_relative 'dish'

class Menu
  def initialize
    @menu_items = {}
  end

  def add_dish(dish)
    @menu_items[dish.name] = dish.price
  end

  def menu_items
    @menu_items.each do |item, price|
      puts "#{item} - £#{price}"
    end
  end
end
