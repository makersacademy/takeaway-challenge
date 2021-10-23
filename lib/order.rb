require 'menu'

class Order
  attr_reader :selection, :menu, :order

  def initialize(menu = Menu.new)
    @selection = {}
    @menu = menu
    @order = []
  end

  def select_dish(item, quantity)
    @selection = { item => quantity }
    add_items_to_order
    return "#{quantity} &#{item}(s) added to your order"
  end

  def add_items_to_order
    @order << @selection
  end
end
