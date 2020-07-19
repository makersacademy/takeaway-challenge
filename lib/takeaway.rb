require_relative 'menu'
require_relative 'basket'

class Takeaway
  attr_reader :menu
  
  def initialize(menu = Menu.new, basket_class = Basket)
    @menu = menu.items
    @basket_class = basket_class
  end

  def current_basket
    @current_basket ||= @basket_class.new
  end
  
  def view_basket
    current_basket.items
  end

  def add_to_basket(item)
    current_basket.add(item)
  end

  def view_basket_breakdown
    i = 1
    puts "In your current basket:"
    current_basket.items.each do |item|
      puts "#{i} x #{item[:name]} = £#{item[:price]}"
      i += 1
    end
    puts "Total: £#{current_basket.show_total}"
  end

  
end

require_relative 'textmessage'



# view_menu to puts menu


