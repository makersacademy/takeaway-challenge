
class Order
  attr_reader :current_order
  def initialize
    @current_order = ""
    @menu
  end

  def load_menu(arr)
    @menu = arr
    p "Menu passed to orders"
  end


end
