class Menu

  attr_reader :dish

  def initialize
    @dish = {
      "Tofu salad" => 2.5,
      "Miso soup" => 1.1,
      "Ming's wings" => 3.9,
      "Spaghetti" => 6.9,
      "Bag of Ducks" => 8.0,
      "Water from A Questionable Source" => 0.1
    }
  end

  def price(dish)
    @dish[dish]
  end

end
