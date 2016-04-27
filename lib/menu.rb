class Menu
  attr_reader :menu
  def initialize
    @menu = {
      "duck breast with anchovies" => 3.50,
      "marmite and cement" => 5.50,
      "battery burger" => 4.75,
      "panda steak" => 3.96,
      "venison sushi" => 2.50,
      "anchovies & diesel" => 3.00
    }
  end

  def add(item,price)
    @menu[item] = price
  end

  def is_included?(item)
    @menu.include?(item)
  end

  def show_menu #return string (format menu)
    @menu.each{|key,value| puts key,"£#{value}"}
  end

  def menu_select
    @menu.dup
  end
end
