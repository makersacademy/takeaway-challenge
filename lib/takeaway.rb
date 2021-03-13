require 'csv'

class Takeaway
  DIVIDER_LEN = 50

  def initialize
    @food_menu = FoodMenu.new
  end

  def show_menu
    @food_menu.display_menu_in_category
  end

  def choose_food

  end

  def view_order

  end

  def confirm_order

  end

  private

  
end
