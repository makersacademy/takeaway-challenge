# require_relative "./restaurant"

class Menu

  @default_menu = [{dish: 'fries', price: 1.0}, {dish: 'fish', price: 1.5}]

  def initialize(menu = @default_menu)
    @menu = default_menu
  end

  def dishes
    # @menu
  end
end
