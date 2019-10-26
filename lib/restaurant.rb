require_relative "menu"
class Restaurant

  attr_reader :menu, :dishes, :order

  def initialize
    @order = []
  end

  def load_menu(menu = Menu.new)
    @menu = menu
  end

  def choose(dish)
    @menu.dishes.select do |key, value|
      if dish == key
        @order << key
        @order << value
      end
    end
  end




end
