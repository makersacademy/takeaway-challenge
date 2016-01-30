class Takeaway

  def initialize(menu)
    @menu = menu
  end

  attr_reader :menu

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

  attr_reader :estimate, :order, :keys
  
  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end

  def calculate_bill
    Calculator.new(order, self).calculate
  end

  def order_placed 
    send_text("Thank you! Your order was placed "\
              "and will be delivered before #{delivery_time}")
  end

  def send_text(body)
    @keys = Dotenv.load
    @client = Twilio::REST::Client.new keys["ACCOUNT_SID"], keys["AUTH_TOKEN"]
    @client.messages.create(from: '+441452260236',
                            to: '+447930300220', body: body)
  end
end