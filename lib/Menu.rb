class Menu

  attr_reader :menu

  def initialize
    @menu = []
  end

  def menu_add(dish)
    @menu << dish
  end

end
