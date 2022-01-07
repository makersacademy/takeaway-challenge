class List

  def initialize
    @menu = []
  end

  def add_dish(dish)
    @menu << dish
  end

  def view
    @menu
  end
end
