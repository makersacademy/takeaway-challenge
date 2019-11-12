require './lib/item.rb'

class Menu
  attr_reader :item_list

  def initialize
    @item_list = [] #Array containing instances of Item class
  end

  # Takes instances of Item class and adds them to the menu
  def add_item(item)
    if item.kind_of?(Item) == true
      @item_list << item
    else
      raise "#{item} is not an Item class object"
    end
  end

  # Returns the list of items in the menu and their
  # associated prices
  def view_menu
    menu_display = ""
    @item_list.each do |item|
      name = item.name
      price = item.price
      menu_display = menu_display + "#{name}  - £ #{price.round(2)}\n"
    end
    menu_display
  end
end
