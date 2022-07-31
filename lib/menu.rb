class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = { "Egg fried rice" => 2, "Special fried rice" => 2, "Prawn toast" => 2,
      "Chicken balls" => 2.5, "Spring rolls" => 2.5, "Char siu pork" => 3,
      "Beef chow mein" => 3.5, "Spare ribs" => 3.5 }
    @list = []
  end

  def show_menu
    @menu_items.each do |dish, price|
      @list << "#{dish} : £#{price}"
    end
    @list.join("\n").to_s
  end
end
