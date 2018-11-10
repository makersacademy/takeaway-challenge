require_relative 'menu'

class Order
  attr_reader :items_list, :menu

  def initialize(menu)
    @menu = menu
    @items_list = Hash.new
  end

  def check_menu
    @menu

  end

  def add_item(item, quantity = 1)
    @items_list[item] = quantity
    "Item: #{item} with  quantity: #{quantity}, has been added to your order"

  end

  def check_order

  end

  def confirmation_text

  end

end

