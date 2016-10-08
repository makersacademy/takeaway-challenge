$dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

require_relative 'order'
require_relative 'list_module'

class Menu
  include List
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
    list_dishes(@menu)
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
