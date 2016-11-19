require_relative 'menu'

class Interface

  def initialize(name, dishes_menu)
    @menu = dishes_menu.new
    @name = name
  end

  def welcome
    print "Welcome to #{name}, if you are hungry you came to the right place!"
  end

  def actions_menu
    "Input '1' to see our dishes menu.\n
    Input '2' to place an order.\n
    Input '3' to check the status of your order.\n
    Input '4' to exit."
  end

  private
  attr_reader :name

end
