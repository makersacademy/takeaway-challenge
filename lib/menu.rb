# Understands the restaurant menu.

require_relative 'restaurant'

class Menu

  attr_reader :dishes, :header, :footer

  HEADER = "Ty Abs - Whitechapel\nTakeaway Menu"
  FOOTER = "Please order before 10pm\nDelivery is available in the E2 area"

  def initialize(dishes = Restaurant.new.dishes, header = HEADER, footer = FOOTER)
    @dishes = dishes
    @header = header
    @footer = footer
  end

  def display
    "#{header}\n#{display_menu}\n#{footer}"
  end

  def display_menu
    dishes.each do |dish|
      dish.select
    end
  end

  def order_request
  end

end
