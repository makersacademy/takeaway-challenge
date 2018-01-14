class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(plate, amount)
    dishes[plate] = amount
  end

  def total
    item_totals.sum
  end

  private

  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

  attr_reader :menu

end
