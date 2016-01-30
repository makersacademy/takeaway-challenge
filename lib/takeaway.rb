class Takeaway

  ACCOUNT_SID = 'ACe1ded990723482f202fe47c9b5de8a63'
  AUTH_TOKEN = '33f4d96523cf8e5308eddf3fa120c615'

  def initialize(menu)
    @menu = menu
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  attr_reader :menu

  def show_menu
    menu.show
  end

  def select(order, estimate)
    @estimate = estimate
    @select = order
  end

  def confirm_order
    fail "incorrect bill amount" unless calculate_bill == estimate
    order_placed
  end

  private

  attr_reader :estimate
  
  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end

  def calculate_bill
    bill = 0
    @select.each {|k, v| bill += show_menu[k]*v}
    bill  
  end

  def order_placed 
    send_text("Thank you! Your order was placed "\
              "and will be delivered before #{delivery_time}")
  end

  def send_text(body)
    @client.messages.create(from: '+441452260236',
                            to: '+447930300220', body: body)
  end
end