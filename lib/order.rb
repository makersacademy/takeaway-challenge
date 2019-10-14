require 'menu'

class Order

  include Menu

  attr_reader :item, :order

  def initialize
    @order = []
  end

  def add_item(item)
    @item = item
    if item_in_order? then
      add_quantity
      return items
    else
      add_new_item
      return items
    end
  end

  def items
    @order.map { |item| "#{item[:item]} #{item[:quantity]} * #{item[:price]} #{sprintf "%.2f", (item[:quantity]*item[:price].to_f)}" }
  end

  private

  def menu_item
    index = MENU.index {|h| h[:item] == item }
    MENU[index]
  end

  def add_quantity
    index = order.index { |h| h[:item] == item }
    @order[index][:quantity] += 1
  end

  def item_in_order?
    @order.each { |h| return true if h[:item] == item}
    false
  end

  def add_new_item
    @order << { item: menu_item[:item], quantity: 1, price: menu_item[:price] }
  end

end
