class Takeaway

  def initialize(menu, calculator, twilio, order)
    @calculator = calculator
    @menu = menu
    @twilio = twilio
    @order = order
  end

  def show_menu
    menu.show
  end

  def select(items, estimate)
    @estimate = estimate
    order.save = items
  end

  def confirm_order
    fail "incorrect bill amount" unless calculate_bill == estimate
    order.order_placed(twilio)
    "order confirmed: correct amount billed #{estimate}"
  end

  private

  attr_reader :estimate, :order, :calculator, :twilio, :menu

  def calculate_bill
    calculator.calculate(order.save, self)
  end
end