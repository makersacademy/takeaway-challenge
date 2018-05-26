class Menu

  attr_reader :dishes, :header, :footer

  def initialize
    @dishes = [
      { "Chicken Tikka" => 8.99 },
      { "Dry Meat" => 10.99 },
      { "Mixed Grill" => 14.99 },
      { "Chana Dal" => 7.99 },
      { "Peshwari Naan" => 3.99 },
      { "Garlic Naan" => 3.49 },
      { "Plain Rice" => 2.99 }]
    @header = "Ty Abs - Whitechapel\nTakeaway Menu"
    @footer = "Please order before 10pm\nDelivery is available in the E2 area"
  end

  def display
    "#{header}\n#{display_menu}\n#{footer}"
  end

  def display_menu
    dishes.each do |dish|
      dish.select
    end
  end

  # def display_menu
  #   dishes.each do |dish|
  #     dish.each do |key, value|
  #       "#{key}: £#{value}"
  #     end
  #   end
  # end

end
