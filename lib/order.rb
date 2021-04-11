require_relative 'menu.rb'
require_relative 'calculator'

class Order
  attr_reader :menu, :basket, :calculator
  def initialize(menu = Menu.new.availability)
    @basket = []
    @total = 0
    @menu = menu
    @calculator = Calculator.new
  end

  def show_menu
    @menu.each do |item|
      puts "#{item[:dish]}:  #{item[:price]} pounds"
    end 
    return 
  end  

  def add_to_basket(item, portions = 1)
    fail "Sorry, #{item[:dish]} is out stock" unless item[:available?]
    basket_item = { dish: item[:dish], price: item[:price], portions: portions } 
    @basket << basket_item
    # @total += item[:price] * portions
    @calculator.add_to_total(basket_item)
  end  

  def order_summary
    calculator.summary(@basket)
  end
end  