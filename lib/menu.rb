class Menu
  attr_reader :menu

  THE_MENU = {'Chicken Tacos' => 6,
    'Burrito' => 8,
    'Enchiladas' => 7,
    'Quesadillas' => 8,
    'Nachos' => 5,
    'Sangria' => 3,
    'Water' => 2
  }

  def initialize(menu)
    @menu = menu
    list_dishes
  end

  def list_dishes
    @menu = THE_MENU if @menu == nil
  end

  def print
    puts "The Menu:" 
    @menu.map { |dish, price| puts "#{dish}: £#{price}" }
   end
  
end
