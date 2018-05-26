# Understands the restaurant menu.

class Menu

  attr_reader :dishes, :header, :footer

  HEADER = "Ty Abs - Whitechapel\nTakeaway Menu"
  FOOTER = "Please order before 10pm\nDelivery is available in the E2 area"

  def initialize(header=HEADER, footer=FOOTER)
    @dishes = [
      { "Chicken Tikka" => 8.99 },
      { "Dry Meat" => 10.99 },
      { "Mixed Grill" => 14.99 },
      { "Chana Dal" => 7.99 },
      { "Peshwari Naan" => 3.99 },
      { "Garlic Naan" => 3.49 },
      { "Plain Rice" => 2.99 }]
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
