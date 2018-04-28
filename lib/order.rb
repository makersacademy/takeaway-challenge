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
    @selected_dishes << [dish[:name], quantity]
  end

  private

  def set_total

  end
end
