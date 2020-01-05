class Menu
  attr_reader :menu_items
  def initialize
    @menu_items = {
                     "Pizza" => 12,
                     "Pasta" => 10,
                     "Burger" => 8,
                     "Fries" => 4,
                     "Salad" => 5
                  }
  end

  def view_menu
    @menu_items.map { |name, price| puts "#{name}: £#{price}" }
  end
end
