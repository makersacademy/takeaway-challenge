class Order

  attr_reader :dishes, :menu

  def initialize
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

  def total
    item_totals
  end

  private

  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

end
