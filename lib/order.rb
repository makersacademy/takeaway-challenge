require_relative 'menu'

class Order 
  attr_reader :order_list, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order_list = []
  end

  def order_item(item)

    menu.menu.each { |element| order_list << element if element[:dish] == item }
  end

  def items_in_order
    string = ''
    order_list.each { |element| string += "#{element[:dish]}, "}
    string.chomp(', ')
  end

  def total_price
    total = 0
    order_list.each { |element| total += element[:price] }
    total
  end
end