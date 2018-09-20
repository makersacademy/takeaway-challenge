class Menu
  attr_reader :name, :price

  def initialize
    @menu = [{"Lasagna" => 10}, {"Pasta" => 5}]
  end

  def add(dish)
    @menu << dish.item
  end

  def show
    @menu
  end

  def include_dish?(ordered_dish)
    @menu.map { |dish| dish.keys }.flatten.include?(ordered_dish)
  end
end
