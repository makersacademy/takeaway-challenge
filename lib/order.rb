
class Order
  attr_reader :current_order, :menu
  def initialize
    @current_order = {}
    @menu
  end

  def load_menu(arr)
    @menu = arr
    p "Menu passed to orders"
  end

  def make_order(number)
    @menu.each { |key, value|
      if key == number
        @current_order[key] = value
        p "Meal selected"
      else
        p "Error with meal choice"
      end
    }
  end

end
