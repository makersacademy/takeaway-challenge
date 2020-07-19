require_relative 'menu'
require_relative 'basket'

class Takeaway
  attr_reader :current_basket
  
  def initialize(menu = Menu.new, basket_class = Basket)
    @menu = menu.items
    @basket_class = basket_class
  end
  
  def view_menu
    i = 1
    puts "The Menu"
    puts "--------"
    @menu.each do |item|
    puts "#{i}. #{item[:name]}. £#{item[:price]}"
      i += 1
    end
  end

  def add_to_basket(item)
    if @current_basket == nil 
      @current_basket = @basket_class.new
    end
    @current_basket.add(item)
  end



end