require_relative 'dish'

class Menu

  attr_reader :menu_items

  def initialize(*dish_items)
    @menu_items = {}
    dish_items.each { |item| menu_items[item.name] = item.price }
  end

end
