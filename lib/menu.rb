require "./lib/order.rb"

class Menu

  attr_reader :english_menu

  def initialize
    @english_menu = {
    "Fish and chips" => 5.50,
    "black pudding" => 4.50,
    "full breakfast" => 7.50,
    "scotch egg" => 2.50 }
  end

  def show_menu
    @english_menu
  end

  def excist?(meal)
    not_exist_error unless meal_excist
    return true
  end


  private

  def not_exist_error
    raise "this is not a menu item"
  end

  def meal_excist(meal)
    @english_menu.key.include?(meal)
  end
end
