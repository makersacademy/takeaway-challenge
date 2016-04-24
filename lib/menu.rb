class Menu

  def initialize
    @menu = {
      "Duck breast with anchovies" => 3.50,
      "Marmite and cement" => 5.50,
      "Battery burger" => 4.75,
      "Panda steak" => 3.96,
      "Venison sushi" => 2.50,
      "Anchovies & diesel" => 3.00
    }
  end

  def add_to_menu(item,price)
    @menu[item] = price
  end

  def menu
    @menu.each{|key,value| puts key,"£#{value}"}
  end

end
