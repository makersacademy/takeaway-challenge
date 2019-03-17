class Order
  def initialize(dish, quantity = 1)
    @selected_dishes = []
    quantity.times { @selected_dishes.push(dish) }
    @confirmed = false
    view_total
  end

  def update(dish, quantity = 1)
    quantity.times { @selected_dishes.push(dish) }
    view_total
  end

  def view_selected
    @selected_dishes
  end

  def view_total
    total = 0
    @selected_dishes.each do |dish|
      total += dish.price
    end
    @total = total
  end

  def confirm_order
    @confirmed = true
  end

  def confirmed?
    @confirmed
  end
end
