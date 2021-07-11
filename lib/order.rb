class Order
  attr_reader :selection
  attr_reader :total

  def initialize(menu)
    @menu = menu
    @total = 0
    @selection = []
  end

  def select_dish(name)
    fail 'That dish does not exist.' unless dish_exists?(name)
    selected_dish = @menu.dishes.find { |dish| dish.name == name }
    update_total(selected_dish)
    @selection << selected_dish
  end

  def review_selection
    display = ""
    @selection.each { |dish| display += "#{dish.name} - £#{dish.price}\n" }
    print display + "Your total is £#{@total}\n"
  end

  private

  def dish_exists?(name)
    @menu.dishes.any? { |dish| dish.name == name }
  end

  def update_total(dish)
    @total += dish.price
  end
end