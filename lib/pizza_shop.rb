require_relative "takeaway_shop.rb"
require_relative "order.rb"

class PizzaShop < TakeawayShop

  attr_reader :menu

  def initialize
    @menu = { "Margherita"   => 7.00,
              "BBQ Pizza"    => 8.50,
              "Pepperoni"    => 9.00,
              "Hawaiian"     => 8.50,
              "Garlic Bread" => 1.95,
              "Fresh Salada" => 1.50,
              "Diet Coke"    => 1.70  }
    @orders = []
  end

end
