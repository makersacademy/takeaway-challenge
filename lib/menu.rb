class Menu
  attr_reader :menu, :order
  def initialize
    @menu = { "Pasta" => 9, "Pizza" => 7, "Steak" => 40, "Ice Cream" => 2 }
  end

  def show_menu
    @menu.each { |item, price| puts "#{item}: £#{price}" }
  end

  def price(item)
    @menu[item] 
  end
end
