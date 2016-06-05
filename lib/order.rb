require_relative 'calculator'

class Order

  def initialize(item, quantity=1)
    check_input(item)
    @order = {item => quantity} if !(@order)
  end

  def add(item, quantity=1)
    check_input(item)
    @order = {item => quantity} if !(@order)
    return order[item] += quantity if order[item]
    @order[item] = quantity
  end

  def view
    order
  end

  def place
    calculator = Calculator.new(@order)
    calculator.sum_quantity
    calculator.sum_price
    calculator.summerize
  end

  def accept
  end

  def reject
  end
  private

  attr_reader :order

  def check_input(item)
    fail 'unknown item inputted, please enter an item on the menu' if check_menu(item) == false
  end

  def menu
    @menu = Menu.new
  end

  def check_menu(item)
    menu.show.include? (item)
  end

end
