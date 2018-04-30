class Menu

attr_reader :menu, :show_menu

 def initialize
    @menu = {
              "Chicken Tika" => 5.00,
              "Rogan Josh" => 5.00,
              "Vindaloo" => 7.00
            }
  end

  def show_menu
    spacing = 32
    menu.each do |dish, price|
      print "#{dish} ";
      print "." * (spacing - dish.length)
      print " £#{price}\n"
    end
  end

  def price_of_dish(dish)
    @menu[dish]
  end

  def add(dish, price)
    @menu.store(dish, price)
    menu
  end
end
