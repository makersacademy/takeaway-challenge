require_relative "order"

class Takeaway
  attr_reader :menu, :current_order

  def initialize
    @menu = { "Margherita pizza" => 9,
    "Pepperoni pizza" => 10,
    "Veggie pizza" => 11,
    "Four Cheese pizza" => 10,
    "Metalover pizza" => 12,
    "Chocolate pizza" => 7,
    "Chips" =>  3,
    "Can of drink" =>  1 }
    @current_order = nil
  end

  def view_menu
    @menu
  end

  def create_order
    @current_order = Order.new(@menu)
  end
end
