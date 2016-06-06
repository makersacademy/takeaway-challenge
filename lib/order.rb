require_relative 'calculator'
require_relative 'texter'

class Order

  def initialize(item, quantity=1)
    check_input(item)
    create_new_order(item, quantity) if no_order_exists?
  end

  def add(item, quantity=1)
    check_input(item)
    return order[item] += quantity if in_basket?(item)
    order[item] = quantity
  end

  def deduct(item, quantity=1)
    fail "You have not yet ordered anything!" if no_order_exists?
    check_input(item)
    fail "You have not yet ordered any #{item}" if !(order[item])
    order[item] -= quantity if in_basket?(item)
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
    get_time
    Texter.new.message(time)
    @order = nil
    p "Your confirmation should be along shortly!"
  end

  private

  attr_reader :order, :time

  def in_basket?(item)
    order[item]
  end

  def no_order_exists?
    !(order)
  end

  def create_new_order(item, quantity)
    @order = {item => quantity}
  end

  def get_time
    @time = Time.now + 3600
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
