class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def menu_item(option)
    @menu[option - 1]
  end

  def add_dishes(*dishes)
    dishes.each { |dish| @menu.push dish }
  end
end
