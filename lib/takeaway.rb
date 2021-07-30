class Takeaway

  attr_reader :MENU, :order
  MENU = { "brocolli" => 3, "risotto" => 10, "bread" => 5 }

  def initialize
    @order = []
    @menu = MENU
  end

  def read_menu
    MENU
  end

  def select(pick)
    @order << MENU.select{|key, value| key == pick}
  end


end
