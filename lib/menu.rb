require './lib/item.rb'

class Menu
  attr_reader :item_list

  def initialize
    @item_list = []
  end

  # add_item - takes instances of Item and adds to the menu
  def add_item(item)
    @item_list << item
  end

# view_menu - returns the list of items in the menu and their
# associated prices
end
