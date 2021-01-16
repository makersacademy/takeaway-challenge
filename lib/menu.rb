class Menu
  attr_reader :menu
  
  MENU = {
    "Sloppy Joe Burger": 10,
     "Fries": 3,
      "Beer": 5
  }

  def initialize
    @menu = MENU
  end

  def read_menu
    @menu.each {|dish, price| puts "#{dish} : £#{price}"}
  end

end