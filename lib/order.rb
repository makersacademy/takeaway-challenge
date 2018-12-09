require_relative 'menu'
require_relative 'sms'

class Order 
attr_reader :menu, :items_ordered, :item, :dishes

  def initialize 
    # doing it this way resets the menu class everytime I put in a new order - fault, would like to keep any added dishes
    @menu = Menu.new
    @items_ordered = []
  end 

  def print_menu
    @menu.dishes
  end 

  def take_order(item)
    @items_ordered << item
  end 

  def calculate_total
    @price = @menu.dishes.select{|x| x[:name] if @items_ordered.include?(x[:name]) }.map{|y| y[:price].to_f}.inject(:+)
  end 

  def print_basket
    @list = @items_ordered.join(", ")
    "You have ordered #{@list} and the total is #{calculate_total()}"
  end

  def complete_order
    SMS.new.send_text()
  end 

end

