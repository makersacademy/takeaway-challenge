class Restaurant
  attr_reader :name, :menu

  def initialize(*menu_items)
    @menu = menu_items
  end

  def show_menu
    puts "Falafel - £3.50"
    puts "Egg Wrap - £5.10"
    puts "Fresh Juice - £0.70"
  end
end
