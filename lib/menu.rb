class Menu

  attr_reader :menu_list

  def initialize
    @menu_list =   { "4x chicken wings" => 1.59,
        "chicken burger meal" => 4.49, "fries" => 1.29, "pizza" => 4.99 }
  end

  def add_to_menu(item, price)
    menu_list[item] = price
  end
end
