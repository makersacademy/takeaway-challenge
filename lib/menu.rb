$dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

require_relative 'order'
require_relative 'list_module'

class Menu
  include List
  attr_reader :selections, :order

  def initialize(menu, order_object)
    @menu = menu
    @selections = []
    @order = order_object
  end

  def view
    list_dishes(@menu)
  end

  def add_dish_to_order(choice)
    @menu.each do |dish|
      @selections << dish if dish[:name].downcase == choice.downcase
      @order.add(dish) if dish[:name].downcase == choice.downcase
    end
  end


end



# my_menu=Menu.new(dishes)
# my_menu.view
