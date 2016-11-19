class Shop

  attr_reader :menu

  def initialize
    @menu = { "Hawaiian" => 8.50, "Margherita" => 7.00, "Pepperoni" => 9.00 }
    @orders = []
  end

  def take_orders( order )
    @orders << order
  end

end
