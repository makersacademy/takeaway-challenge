class Menu
  attr_reader :items

  def initialize
    @items = {}
  end

  def add_to(dish)
    items[dish.name] = dish.price
  end

  private

  attr_writer :items
end
