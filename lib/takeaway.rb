require_relative 'menu'

class Takeaway 

  attr_reader :menu, :basket

  def initialize(menu:, basket:)
    @menu = menu
    @basket = basket
  end

  def print_menu
    menu.print
  end

  def print_basket
    basket.print
  end

  private 

  attr_reader :menu, :basket
end