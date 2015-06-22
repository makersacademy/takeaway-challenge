class Menu

  attr_reader :menu

  def initialize
    @menu = { Falafel: 4,
              Shawarma: 6,
              Coke: 2,
              Water: 1 }
  end

  def show_menu
    menu.each do |dish, price|
       display_menu = "#{dish} " + "£#{price}"
       puts display_menu
     end
  end

  def show
    menu
  end

end
