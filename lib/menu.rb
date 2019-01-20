class Menu

  attr_reader :menu

  def initialize
    @menu = {
      "Cheeseburger" => 10.00,
      "Veggie Burger" => 9.50,
      "Fish & Chips" => 11.00,
      "Sausages & Mash" => 11.00,
      "Steak & Ale Pie" => 12.00,
      "6oz Sirloin Steak" => 15.00
    }
  end

end
