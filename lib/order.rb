
class Order
  attr_reader :current_order, :menu
  def initialize
    @current_order = {}
    @shopping_cart
    @menu
  end

  def load_menu(arr)
    @menu = arr
    p "Menu passed to orders"
  end

  def make_order(number)
    @menu.each { |key|
      if key.flatten[0] == number
        @current_order[:dish] = key.flatten[1].flatten[0]
        @current_order[:price] = key.flatten[1].flatten[1]
        p "Meal selected"
        p @current_order
      end
    }
    @current_order
  end

end
