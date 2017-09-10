class Menu

  attr_reader :menu

  def initialize
    @menu = { "Butter Chicken" =>  7,
             "Pad Thai" => 8,
             "Burrito Lasagne" => 2,
             "Full Works Pizza" => 5,
             "Cheese Naan" => 3 }
  end

  def print_menu
    menu.each do |dish, price|
      print dish.ljust(25)
      puts "£#{price}".rjust(25)
    end
  end

  def confirm_price(price)
    menu[price]
  end
end
