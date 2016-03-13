class Menu

  def initialize
    @menu = []
  end

  def view
    @menu.dup
  end

  def add(dish)
    @menu << dish
  end

end
