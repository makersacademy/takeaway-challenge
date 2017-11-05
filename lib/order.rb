require 'menu.rb'
#require 'verification.rb'

# this shows the list of dishes which can be added to an order
class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    menu.list
  end

  def print_menu
    menu.list.each do |key, dish|
      puts "#{dish.name} £#{dish.price},"
    end
  end
end
