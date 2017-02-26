require 'menu'
require 'order'
require 'csv'

class Restaurant

  attr_reader :name, :menu

  def initialize(name)
    @name = name
  end

  def create_menu(filename)
    @menu = Menu.new(filename)
  end

  def display_menu
    @menu ? @menu.print : "No menu exists. Please contact the restaurant"
  end

  def create_order
    Order.new
  end

  def confirm
  end

end
