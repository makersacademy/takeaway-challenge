class Shop

  attr_reader :menu

  def initialize
    @menu = { "Hawaiian" => 8.50, "Margherita" => 7.00, "Pepperoni" => 9.00 }
  end

end
