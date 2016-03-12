class TakeAway

  attr_reader :basket, :total, :menu

  def initialize
    @basket = []
    @total = []
  end

  def menu
    @menu = {
        "Bratwurst in a bun" => 2.49,
        "Bockwurst in a bun" => 2.49,
        "Käsekrainer in a bun" => 2.79,
        "Veggie sausage in a bun" => 2.29,
        "Sauerkraut" => 1.19,
        "Crispy onions" => 0.29,
        "Mustard" => 0.29,
        "Ketchup" => 0.29,
        "Sidesalad" => 0.75,
        "Orange juice" => 1.49,
        "Weißbier" => 2.99,
        "Schwarzbier" => 2.99
      }
  end

  def order(quantity,dish)
    price = self.menu[dish]
    @basket << quantity << dish << price
  end



end
