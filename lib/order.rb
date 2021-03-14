require_relative 'messenger'

class Order
  attr_reader :status

  def initialize(user, items)
    @user = user
    @items = items
    @status = "not processed"
  end

  def confirm_order(messenger = Messenger.new, msg = nil, time = Time.now)
    @status = "confirmed"
    msg ||= "Thank you! Your order was placed and will be delivered before #{time.hour+1}:#{time.min.to_s.rjust(2,"0")}"
    messenger.send_sms(@user.mobile, msg)
  end
end