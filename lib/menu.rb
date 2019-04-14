class Menu
  attr_reader :dishes
  
  def initialize(dishes = { pizza: 5, pasta: 7, salad: 6 })
    @dishes = dishes
  end

  def print_menu
    menu = ""
    @dishes.each do |dish, price|
      menu += "#{dish} ... £#{price}\n"
    end
    menu
  end
end
