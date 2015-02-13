require_relative 'menu'

class Order

include Menu

attr_accessor :order_list

def initialize
  @order_list = {}
end

def item_count
  @order_list.length
end

def request_order
  @item = ""
  while @item != "exit"
    request_item
    break if @item == "exit"
    request_quantity  
    add_items
  end
end

def request_item
  puts "Please select an item from the menu (using the number code). Type 'exit' to finish."
  @item = gets.chomp
end

def request_quantity
  puts "Quantity?"
  @quantity = gets.chomp
end

def select_item(item, quantity)
  @item = item
  @quantity = quantity
  add_items
end

def add_items
  @order_list[@item] = @quantity
end

def get_item_prices
  @unit_prices = []
  @order_list.each{|item, quantity| @unit_prices << PRICE_LIST[item] * quantity.to_f}
  @unit_prices
end

def get_overall_price
  @unit_prices.inject(0) {|sum, i|  sum + i }
end




end