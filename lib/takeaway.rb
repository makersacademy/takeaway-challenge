class Takeaway

  attr_reader :menu

  def initialize
    @menu = {"Chicken Gyoza" => 4.20,
             "Katsu Curry & Rice" => 8.50,
             "Nettle Soup" => 2.00,
             "Sushi Rolls (6 pieces)" => 5.60,
             "Edamame" => 3.00,}
  end

end
