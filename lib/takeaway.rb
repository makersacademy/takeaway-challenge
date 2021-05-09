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
    if @order.current.include?(selected_item)
      @order.current.each { |item| item[:quantity] += quantity if item[:name] == selected_item[:name]}
    else
      selected_item[:quantity] = quantity
      @order.current << selected_item
    end
    p @order.current
  end
end