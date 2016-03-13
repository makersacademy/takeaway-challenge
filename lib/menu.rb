class Menu

  attr_accessor :menu_list

  def initialize
    @menu_list = { "pizza" => 3.50,
            "chips" => 1.50,
            "burger" => 3 }
  end

  def add(dish, price)
    @menu_list[dish] = price
  end

  def read
    @menu_list
  end

  def price(dish)
    @menu_list[dish]
  end

end
