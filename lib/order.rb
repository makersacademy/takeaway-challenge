class Order

  attr_accessor :current_order, :total

  def initialize(menu)
    @current_order = {}
    @total = 0
    @dishes = menu.dishes
    @sum = 0
  end

  def add_to_order(dish, quantity)
    raise 'Dish not available: not part of the menu' unless @dishes.include?(dish)
    @current_order.merge!({ dish => quantity })
    calculate_total
  end

  def complete_order(sum)
    @sum = sum
    raise 'Payment error: incorrect payment submitted' unless sum == @total
    reset
  end

  private

  def calculate_total
    @total = 0
    @current_order.each do |key, value|
      @total += (@dishes[key] * value)
    end
  end

  def reset
    @current_order = {}
    @total = 0
  end

end
