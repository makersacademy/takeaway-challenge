class Menu

  MENU = { "spring roll" => 0.99, "char sui bun" => 3.99, "pork dumpling" => 2.99,
    "peking duck" => 7.99, "fu_king fried rice" => 5.99 }

  def initialize
    @menu = MENU
  end

  def display_menu
    @menu
  end
end
