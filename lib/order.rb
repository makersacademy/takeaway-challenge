require_relative 'menu'

class Order
  attr_reader :basket, :menu, :item

  def initialize(menu)
    @menu = menu.items
    @basket = {}
  end

  def add_item(item, quantity) #1) find way to add quantity ? or not.. ?
    raise "INVALID SELECTION" unless valid_selection(item)
    @basket[item.capitalize] = quantity 
  end

  private 

  def valid_selection(item)
    @menu[item.capitalize] != nil
  end

end

# ord = Order.new(Menu.new({"Soup" => 2, "Bread" => 1}))
# puts ord.add_item("pizza", 3)