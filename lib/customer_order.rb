class CustomerOrder

  attr_reader :selection, :bill

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

  def total
    calculate_bill
    puts "Current order amounts to: £#{@bill.total}"
  end

  def process(customer_amount)
    validate_payment(customer_amount)
    @text.send
  end

  private

  def validate_payment(customer_amount)
    raise "Error: Incorrect payment!" unless bill_valid?(customer_amount)
  end

  def validate_dish(dish, quantity)
    raise "Error: Dish is not in menu!" unless @menu.available?(dish)
    raise "Error: Invalid quantity!" unless quantity.is_a? Integer
    puts "#{quantity}x #{dish} added to order!"
  end

  def bill_valid?(customer_amount)
    calculate_bill
    @bill.total == customer_amount
  end

  def calculate_bill
    @bill.calculate_bill(@menu.list, @selection)
  end

end
