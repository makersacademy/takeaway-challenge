# Understands the restaurant menu.

require_relative 'restaurant'

class Menu

  attr_reader :dishes, :header, :foot

  HEADER = "Ty Abs - Whitechapel\nTakeaway Menu"
  FOOT = "Please order before 10pm\nDelivery is available in the E2 area"

  def initialize(dishes = Restaurant.new.dishes, header = HEADER, foot = FOOT)
    @dishes = dishes
    @header = header
    @foot = foot
  end

  def display
    "#{header}\n#{display_menu}\n#{foot}"
  end

  def display_menu
    dishes
  end

end
