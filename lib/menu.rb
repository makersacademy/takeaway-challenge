class Menu

  attr_reader :menu

  def initialize
    @menu = { "1 Chip" => 90, "Eels" => 50, "Octopus" => 120, "Pea" => 200, "Deep Fried Banana" => 250 }
  end

  def see_menu
    @menu.each { |item, price| puts "#{item}: £#{price}" }
  end

  def price(item)
    @menu[item]
  end
end
