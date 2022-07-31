require_relative 'menu'
require_relative 'dish'

class Order 
  attr_reader :order_list, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @order_list = []
  end

  def order_item(item)
    name, price = '', 0
    menu.menu.each { |element| name, price = element[:dish], element[:price] if element[:dish] == item }
    order_list << Dish.new(name, price)
  end

  def print_basket
    string = ''
    order_list.each { |element| string += "#{element.name}, "}
    string.chomp(', ')
  end

  def total_price
    total = 0
    order_list.each { |element| total += element.price }
    total
  end
end