require_relative 'order'

class Menu

  attr_reader :menu

  def initialize
    @menu = {
      Margherita: 8.99,
      Napoli: 6.99,
      Hawaiian: 9.99
    }
  end

  def show_menu
    @menu
  end

  def available?(dish)
    !@menu[dish.to_sym].nil?
  end

  def price(dish)
    @menu[dish]
  end
end