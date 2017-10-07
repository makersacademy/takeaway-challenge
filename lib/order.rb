require 'menu'

class Order

  attr_reader :order_menu, :order_basket

  def initialize(menu = Menu.new, basket = Basket.new)
    @order_menu = menu
    @order_basket = basket
  end

  def add_item
    item_num = $stdin.gets.chomp.to_i
    item_quant = $stdin.gets.chomp.to_i
  end
end
