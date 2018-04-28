class CustomerOrder

  attr_reader :selection

  def initialize(dishes = Dishes.new)
    @dishes = dishes
    @selection = []
    @bill = 0
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
    @bill.total
    @bill.total == customer_amount
  end

  def calculate_bill
    @bill = Bill.new(@dishes.menu, @selection)
    @bill.calculate_bill
  end
end
