class Menu

  attr_reader :items 

  def initialize
    @items = { "margarita" => 5,
              "garlic bread" => 3,
             }
  end
end
