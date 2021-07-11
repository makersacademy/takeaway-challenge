class Order
  attr_reader :selection

  def initialize(menu)
    @menu = menu
    @selection = []
  end

  def select_dish(name)
    @selection << @menu.dishes.find { |dish| dish.name == name }
  end
end