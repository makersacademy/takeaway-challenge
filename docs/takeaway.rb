class TakeAway
  attr_reader :menu

  def initialize
    @menu = { "Salmon sushi" => 2.99,
             "Vegetable sushi" => 1.99,
             "Rice" => 1.59,
             "Katsu chicken" => 2.99 }
  end
end
