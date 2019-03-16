class Order
  def initialize(dish, quantity = 1)
    @selected_dishes = []
    quantity.times { @selected_dishes.push(dish) }
    @confired = false
  end

  def update(dish, quantity = 1)
    quantity.times { @selected_dishes.push(dish) }
  end

  def view_selected
    @selected_dishes
  end

  def view_total
    total = 0
    @selected_dishes.each do |dish|
      total += dish.price
    end
    total
  end

  def confirmed?
    @confired
  end
end