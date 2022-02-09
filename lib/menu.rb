class Menu

MENU_LIST = {
    Pork_gyros:         7.80,
    Chicken_gyros:      7.80,
    Spinach_pie:        3.50,
    Pita_bread:         1.00,
    Greek_salad:        5.60,
    Tzatziki:           3.50,
    Feta_sauce:         1.00,
}

attr_reader :order_choice, :stock

def initialize
  @stock = stock
  @order_choice = Hash.new
end

  def menu_dishes # defined method
  MENU_LIST # calls items from CONSTANT above
  end
end

# order = Menu.new
# p order.menu_dishes
# p order.order_choice

