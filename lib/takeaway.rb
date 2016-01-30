class Takeaway

  def initialize(menu, calculator, twilio)
    @calculator = calculator
    @menu = menu
    @twilio = twilio
  end

  def show_menu
    menu.show
  end

  def select(order, estimate)
    @estimate = estimate
    @order = order
  end

  def confirm_order
    fail "incorrect bill amount" unless calculate_bill == estimate
    order_placed
  end

  private

  attr_reader :estimate, :order, :calculator, :twilio, :menu
  
  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end

  def calculate_bill
    calculator.calculate(order, self)
  end

  def order_placed 
    send_text("Thank you! Your order was placed "\
              "and will be delivered before #{delivery_time}")
  end

  def send_text(body)
    twilio.messages.create(from: Dotenv.load['FROM'], to: Dotenv.load['TO'], body:body)
  end
end