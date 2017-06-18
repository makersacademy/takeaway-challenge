

require_relative "order"
require_relative "menu"
require_relative "messager"

# Understands how to oversee buying food via CL.

class Takeaway

  def initialize(menu = Menu.new, order = Order.new, messager = Messager.new)
    @menu = menu
    @order = order
    @messager = messager
  end

  def show_menu
    menu.show_food
  end

  def add(food, quant = 1)
    check_right(food.to_sym)
    order.add(food.to_sym, quant)
  end

  def summary
    order.summary
  end

  def checkout(payment)
    check_correct(payment)
    messager.send_confirmation()
  end

private

  attr_reader :menu, :order, :messager

  def check_correct(payment)
    fail "You're short. Please pay the correct sum man." if payment < order.total
  end

  def check_right(food)
    fail "That's not on the menu!" unless menu.has?(food)
  end

end
