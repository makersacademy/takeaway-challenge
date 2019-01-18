class Menu
  attr_reader :menu_list
  MENU_TITLE = 'Menu List:'
  private_constant :MENU_TITLE
  def initialize
    @menu_list = []
  end

  def add(dish)
    menu_list << dish
  end

  def display
    puts MENU_TITLE
    menu_list.each.map { |dish| dish.formatted_display }.join("\n")
  end
end
