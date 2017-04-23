class Order
  DISHES = { :pesto => 6.50, :ravioli => 7.95, :tortellini => 8.95, :lasagna => 9.95 }
  FREE_DELIVERY = 25

  def initialize
    @my_dishes    = []
    @total        = 0.round(2)
    @delivery_fee = 3
    @my_order = {}
  end

  def see_dishes
    DISHES
  end

  def add_dish(dish)
    dish = dish.to_sym
    raise "Sorry, dish not found" unless DISHES.has_key?(dish)
    @my_dishes << dish if DISHES.has_key?(dish)
    add_to_my_order(dish)
    @total += DISHES[dish]
    @total.round(2)
  end

  def remove_dish(dish)
    dish = dish.to_sym
    index = @my_dishes.index(dish)
    @my_dishes.delete_at(index)
    remove_from_my_order(dish)
    @total -= DISHES[dish]
    @total.round(2)
  end

  def summary
    total_checker
    { order: @my_order, total: @total.round(2) }
  end

  # def place_order
    # raise 'The total sum is not correct' if
    # "Thank you! Your order was placed and will be delivered before "
  # end

  private

  def add_to_my_order(dish)
    @my_order[dish] = @my_dishes.count(dish)
  end

  def remove_from_my_order(dish)
    @my_order[dish] -= 1
  end

  def total_checker
    if @total >= FREE_DELIVERY
      @delivery_fee = 0.0
    else
      @delivery_fee
    end
  end

end
