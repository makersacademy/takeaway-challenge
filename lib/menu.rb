class Menu

  attr_reader :items 

  def initialize
    @items = { "margarita" => 5,
              "fries" => 3,
             }
  end
end
