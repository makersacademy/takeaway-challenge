require_relative "menu"
class Order


attr_reader :full_menu, :order

def initialize
  @full_menu = Menu.new
  @order=[]
end

def view_menu
 @full_menu.menu.menu.each_with_index do |item, index|
  puts "#{index+1}. #{item[:pizza]}: £#{item[:price]}"
 end
end

def add_dish(number, quantity)
  @added = {:item => @full_menu.menu[number-1][:pizza], :quantity => quantity, :cost => @full_menu.menu[number-1][:price] }
  @order << @added
end

def order_calculator
  @order.each {|item| @total_price = item[:quantity]*item[:cost]}
end


end
