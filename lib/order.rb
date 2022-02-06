class Order
  def initialize(dish, quantity = 1)
    @selected_dishes = [{ dish => quantity }]
    @confirmed = false
  end
  
  def update(dish, quantity = 1)
    @selected_dishes << { dish => quantity }
  end
  
  def view_selected
    @selected_dishes
  end
  
  def confirmed?
    @confirmed
  end
end
