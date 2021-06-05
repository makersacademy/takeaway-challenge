require_relative './menu.rb'

class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = Menu.new(menu)
  end

  def show_menu
    @menu.show_menu
  end

  def order_food
    
  end
end