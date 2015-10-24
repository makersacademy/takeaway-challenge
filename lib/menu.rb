class Menu

  attr_reader :items

  def initialize
    @items = { "Pure Beef Hamburger" => 1,
              "Tempting Cheeseburger" => 1.5,
              "Triple-Thick Shakes" => 2,
              "Golden French Fries" => 0.5,
              "Thirst_Quenching Coke" => 0.5,
              "Delightful Root Beer" => 0.5,
              "Steamy Hot Coffee" => 0.5,
              "Full-Flavour Orange Drink" => 0.5,
              "Refreshingly Cold Milk" => 0.75
            }
  end
end
