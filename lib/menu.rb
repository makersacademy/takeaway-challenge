class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = { "egg fried rice" => 2,"special fried rice" => 2,"prawn toast" => 2,
      "chicken balls" => 2.5,"spring rolls" => 2.5,"char siu pork" => 3,
      "beef chow mein" => 3.5,"spare ribs" => 3.5 }
  end

  def show_menu
    @menu_items
  end
end
