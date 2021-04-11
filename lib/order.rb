require_relative 'menu'
class Order
  attr_reader :menu, :selection, :cart

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = {}
    @cart = []
  end 

  def see_menu
    @menu.read_menu
  end 

  def place_order(item, amount)
    raise "#{item} is not on the menu today" unless @menu.dish?(item)

    @selection = { item.to_sym => amount }
    add_to_cart
    return "#{amount}x #{item}(s) added to basket"
  end 

  private 

  def add_to_cart
    @cart << @selection
  end 
end 
