class Order
  attr_reader :customer, :ordered_dishes, :checked_out, :ready

  def initialize customer
    @customer, @ordered_dishes, @checked_out = customer, [], false
    @ready = false
  end

  def add_dish dish
    @ordered_dishes.push(dish)
  end

  def remove_dish dish
    @ordered_dishes.delete(dish)
  end

  def checkout
    @checked_out = true
  end

  def ready_for_delivery
    @ready = true
  end
end
