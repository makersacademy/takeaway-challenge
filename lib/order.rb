require_relative 'menu'
require_relative 'restaurant'

class Order
  attr_reader :orders
  def initialize(menu = Menu)
    @menu = menu
    @orders = {}
    @total = []
  end

  def add(quantity = 1,item)
    fail "No such item!" unless @menu.include?(item)
    menu_item = menu.select{|key,value|key[item]}
    @orders[quantity] = menu_item
    @total << menu_item.values.map{|i|i*quantity}
    "#{quantity} X #{item} added to basket"
  end

  def show_order
    fail "No order created" if empty?
    @orders
  end

  def check_total
    @total.flatten.reduce(:+)
  end

  def empty?
    @orders.empty?
  end

  def menu
    @menu.menu_select
  end
end
