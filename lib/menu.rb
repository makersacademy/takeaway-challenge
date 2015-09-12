class Menu

  attr_reader :menu

  def initialize
    @menu =   { "4x chicken wings" => 1.59,
        "chicken burger meal" => 4.49, "fries" => 1.29 }
  end

  def add_to_menu(item, price)
    @menu[item] = price
  end
end
