require 'yaml'


class Menu

attr_reader :items, :order

  def initialize(file)
    @items = YAML.load_file(file)
    @order = []
  end

  def view_menu
    @items
  end

  def choose(order_item_number)
    order_item_number.each{|item_number|
       @order << self.items[item_number]
     }
  end


end



#menu = Menu.new(menu.txt) # => makes a new menu that it reads from a text file.

#then we just need a menu.txt of the format:
# "Item name": "Price in £s"
