require 'twilio-ruby'

class Takeaway

  def initialize(menu)
    @select = {}
    @menu = menu
    @estimate = 0
    @client = Twilio::REST::Client.new 'ACe1ded990723482f202fe47c9b5de8a63', '33f4d96523cf8e5308eddf3fa120c615'
  end

  attr_reader :menu, :estimate

  def show_menu
    menu.show
  end

  def select(order, estimate)
    @estimate = estimate
    @select = order
  end

  def correct_bill?
    fail "incorrect bill amount" unless calculate_bill == estimate
    confirm_order
  end

  private
  
  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end

  def calculate_bill
    bill = 0
    @select.each {|k, v| bill += show_menu[k]*v}
    bill  
  end

  def confirm_order  
    send_text("Thank you! Your order was placed and will be delivered before #{delivery_time}")
  end

  def send_text(body)
    @client.messages.create(from: '+441452260236', to: '+447930300220', body: body)
  end
end