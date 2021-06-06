require_relative 'takeaway'

class Chinese < Takeaway

  attr_reader :menu

  def initialize
    @menu = { "Spring Rolls" => 4.00,
              "Chicken Satay" => 6.50,
              "Black Bean Beef" => 10.00,
              "Crispy Duck" => 11.50,
              "Chicken Chow Mein" => 5.95,
              "Egg Fried Rice" => 2.50,
              "Diet Coke" => 1.50,
              "Bottled Water" => 1.00 }
    @orders = []
  end
end