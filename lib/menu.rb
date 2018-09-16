require_relative 'menuFormatter.rb'
require_relative 'order.rb'

class Menu

  attr_reader :menu

  def initialize
    @menu = [{ :item => "Pizza", :price => "5.00" },
      { :item => "Nuggets", :price => "3.00" },
      { :item => "Cheesy Garlic Bread", :price => "3.00" },
      { :item => "Chips", :price => "1.00" },
      { :item => "Burger", :price => "4.00" }
    ]
    @formatter = MenuFormatter.new
    @order = Order.new
  end

  def display
    @formatter.format(@menu)
  end

end
