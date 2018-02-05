class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "Pork Pie" => 4.99,
                "Sausage Roll" => 2.50,
                "Spicy Soup" => 3.00
              }
  end
end
