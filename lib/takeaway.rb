class Takeaway
  attr_reader :menu, :basket

  def initialize
    @menu = { "Chicken Curry" => 4, "Lamb Curry" => 4, "Vegetable Curry" => 3, "Keema" => 4, 
              "Mixed Grill" => 9, "Samosa" => 2, "Chicken Kebab" => 3, "Lamb Kebab" => 4 }
    @basket = {}
    @total = 0
  end
end