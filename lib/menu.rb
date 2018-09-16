require_relative 'menuFormatter.rb'
require_relative 'order.rb'

class Resturant

  attr_reader :menu

  def initialize
    @menu = [{ :dish => "Pizza", :price => "5.00" },
      { :dish => "Nuggets", :price => "3.00" },
      { :dish => "Cheesy Garlic Bread", :price => "3.00" },
      { :dish => "Chips", :price => "1.00" },
      { :dish => "Burger", :price => "4.00" }
    ]
    @formatter = MenuFormatter.new
    @order = Order.new
  end

  def display_menu
    @formatter.format(@menu)
  end

end
