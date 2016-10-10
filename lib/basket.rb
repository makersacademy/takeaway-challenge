require_relative "menu"
require_relative "order"

class Basket

attr_reader :basket, :total

def initialize
 @basket = []
 @total = 0
 @full_menu = Menu.new
end

def in_basket(number, quantity)
  @added = {item: @full_menu.menu[number-1][:pizza], quantity: quantity, cost: @full_menu.menu[number-1][:price] }
  @basket << @added
end

def open_basket
  @basket.each {|item| puts "#{item[:quantity]}x #{item[:item]} : £#{item[:cost]}" }
end

def sum_basket
  @basket.each { |item| @total += item[:quantity]*item[:cost]}
 puts "Your total is £#{@total}"
end



end
