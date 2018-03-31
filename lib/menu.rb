require_relative 'dish'
class Menu

  attr_reader :dishes
  def initialize
    @dishes = {
      'burger' => 5.00,
      'hot dog' => 3.75,
      'fries' => 2.50,
      'soda' => 1.50,
    }

    # [ Dish.new('burger', 4.00),
    #   Dish.new('hot dog', 3.50),
    #   Dish.new('fries', 2.50),
    #   Dish.new('soda', 1.50) ]
  end

  def print_menu
    menu_display = []
    # @dishes.each { |dish| menu_display << "#{dish.name}: $#{dish.price}"}
    @dishes.each { |k,v| menu_display << "#{k}: $#{v}"}
    menu_display.join(", ")
  end

  def contains?(dish)
    not_on_menu_error unless dish_on_menu?(dish)
    return true
  end

  private

  # ERROR MESSAGES
  def not_on_menu_error
    raise "This dish is not on the menu!"
  end

  # HELPER METHODS
  def dish_on_menu?(dish)
    @dishes.keys.include?(dish)
  end


end
