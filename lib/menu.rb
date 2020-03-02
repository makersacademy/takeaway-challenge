class Menu 

  attr_reader :menu

  def initialize
    @menu = {
      "Hoisin Duck" => 10,
      "Avo on toast" => 6,
      "Steak & Chips" => 10
    }
  end
  def display
    return @menu.each { |item, price|
      puts "* #{item} ~ #{price} *"
    }
  end
end