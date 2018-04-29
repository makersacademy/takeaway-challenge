class Order

  attr_reader :total, :category

  def initialize(category)
    @selected_dishes = []
    @total = 0
    @category = category
  end

  def selected_dishes
    @selected_dishes.dup
  end

  def add(dish, quantity)
    name, price, amount = dish[:name], dish[:price], quantity
    @selected_dishes << [name, price, amount]
    adjust_total(price, amount)
  end

  private

  def adjust_total(price,quantity)
    @total += price * quantity
  end

end
