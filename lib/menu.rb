# require_relative 'dish'

class Menu

  def initialize
    @menu_items = {
      'chicken jalfrezi' => 7.99,
      'onion bhaji' => 3.99,
      'naan' => 2.99,
      'rice' => 1.99
    }
  end

  def show_menu
    @menu_items.dup
  end

end
