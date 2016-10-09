$dishes = [
{name: "Pasta", price: 3.50},
{name: "Pizza", price: 2.40}
]

require_relative 'order'
require_relative 'list_module'
require_relative 'sms'

class Menu
  include List
  attr_reader :selections, :order

  def initialize(menu, order_object=Order)
    @menu = menu
    @order = order_object
  end

  def view
    list_dishes(@menu)
  end

  def add_dish_to_order(choice)
    @menu.each do |dish|
      @order.add(dish) if dish[:name].downcase == choice.downcase
    end
  end


end



# my_menu=Menu.new(dishes)
# my_menu.view
