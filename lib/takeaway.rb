require 'menu'
require 'order'
class Takeaway 
  attr_reader :menu, :order
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def add_to_order(name, quantity)
    selected_item = @menu.items.find { |item| item[:name] == name} 
    # if seleceted quanity < quantity throw error and say available amount
    @order.current << { name: selected_item[:name], price: selected_item[:price], quantity: 1 }
    # some check to see if already in order
    p @order.current
    # need to update quantity
  end
end