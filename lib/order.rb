require_relative 'calculator'
require_relative 'texter'

class Order

  def initialize(item, quantity=1)
    check_input(item)
    @order = {item => quantity} if !(order)
  end

  def add(item, quantity=1)
    check_input(item)
    @order = {item => quantity} if !(order)
    return order[item] += quantity if order[item]
    order[item] = quantity
  end

  def deduct(item, quantity=1)
    fail "You have not yet ordered anything!" if !(order)
    check_input(item)
    fail "You have not yet ordered any #{item}" if !(order[item])
    order[item] -= quantity if order[item]
  end

  def view
    order
  end

  def place
    calculator = Calculator.new(@order)
    calculator.sum_price
    calculator.summerize
  end

  def confirm
    time = get_time
    text = Texter.new
    text.message(time)
    @order = nil
    p "Your confirmation should be along shortly!"
  end

  private

  attr_reader :order

  def get_time
    Time.now + 3600
  end

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
