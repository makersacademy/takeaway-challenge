class CustomerOrder

  attr_reader :selection

  def initialize(menu = Menu.new, bill = Bill.new, text = Text.new)
    @menu = menu
    @selection = []
    @bill = bill
    @text = text
  end

  def select_dish(dish, quantity)
    validate_dish(dish, quantity)
    @selection << {dish: dish, quantity: quantity}
  end

  def process(customer_amount)
    raise "Error: Incorrect payment!" unless bill_valid?(customer_amount)
    @text.send
  end

  def validate_dish(dish, quantity)
    raise "Error: Dish is not in menu!" unless @menu.available?(dish)
    raise "Error: Invalid quantity!" unless quantity.is_a? Integer
  end

  def bill_valid?(customer_amount)
    calculate_bill
    @bill.total == customer_amount
  end

  def calculate_bill
    @bill.calculate_bill(@menu.list, @selection)
  end

end
