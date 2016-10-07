$dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

require_relative 'order'

class Menu
  attr_reader :selections

  def initialize(menu, order_class = Order)
    @menu = menu
    @selections = []
    @order = order_class.new
  end

  # def user_interface
  #   puts "What would you like to do?\n\n"
  #   while true
  # end

  def view
    @menu.each_with_index do |dish, i|
      puts "#{i+1}: #{dish[:name]} costs #{dish[:price]}"
    end
  end

  def select_dish(choice)
    $dishes.each do |dish|
      @selections << dish if dish[:name].downcase == choice.downcase
      @order.add(dish) if dish[:name].downcase == choice.downcase
    end
  end

  def confirm_order

  end




end



# my_menu=Menu.new(dishes)
# my_menu.view
