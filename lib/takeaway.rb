# Select menu items, quantities and places order.

class Takeaway

  attr_reader :menu

  def initialize
    @menu = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
  end

  def read_menu
    @menu
  end
end
