require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def options
    puts "\nWhat would you like to order?"
  end
end