class Menu

attr_reader :pizza

  def initialize
    @pizza = {"margherita" => 8,
              "pepperoni" => 9,
              "hawaiian" => 9,
              "meat_feast" => 10,
              "vegetable" => 9,
              "four_cheese" => 9}
  end
end
