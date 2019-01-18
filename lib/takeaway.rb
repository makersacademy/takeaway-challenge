require_relative 'menu'

class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    @menu.display
  end

  def order(dish, quantity)

  end

  def basket_summary

  end

  def calculate_total

  end

  def checkout

  end

end
