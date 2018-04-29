class CustomerOrder

  attr_reader :selection

  def initialize(dishes = Dishes.new, bill = Bill.new)
    @dishes = dishes
    @selection = []
    @bill = bill
  end

  def select_dish(dish, quantity)
    validate_dish(dish, quantity)
    @selection << {dish: dish, quantity: quantity}
  end

  def validate_dish(dish, quantity)
    raise "Error: Dish is not in menu!" unless @dishes.in_menu?(dish)
    raise "Error: Invalid quantity!" unless quantity.is_a? Integer
  end

  def bill_valid?(customer_amount)
    calculate_bill
    @bill.total == customer_amount
  end

  def calculate_bill
    @bill.calculate_bill(@dishes.menu, @selection)
  end

end
