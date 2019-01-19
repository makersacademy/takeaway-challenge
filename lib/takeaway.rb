require_relative 'pizza'

class Takeaway

  attr_reader :menu

  def initialize(menu_class = Pizza.new)
    @menu = menu_class
  end

  def view_menu
    @menu.view_food_and_price
  end

end
