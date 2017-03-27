class Order

  attr_reader :dishes, :sum, :add

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

  def sum
    total_amount.inject(:+)
  end

  private
  attr_reader :menu

  def total_amount(dishes)
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

end
