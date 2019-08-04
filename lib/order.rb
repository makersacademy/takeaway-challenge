require_relative 'takeout'
require 'twilio-ruby'

class Order

  attr_accessor :time

  def initialize(menu)
    @takeout = Takeout.new(menu)
    @change = 0
    @time = nil
  end

  def view_menu
    @takeout.menu.each {|item, price| puts "#{item}:#{price.to_s.insert(2,".")}"}
  end

  def select(item, number)
    @takeout.order[item] = number
  end

  def placeorder(cash, mobile_number)
    if cash >= @takeout.price
      @change += (cash - @takeout.price)
      puts "order placed"
      @time = Time.now
      text(time, mobile_number)
    else
      raise 'not enough cash!'
    end
  end

  def time
    if @time.hour < 23
      @delivery_hour = @time.hour + 1
    else
      @delivery_hour = 00
    end
    @delivery_min = @time.min.to_s
    if @delivery_min.length == 1
      @delivery_min.insert(0, "0")
    end
    @delivery_hr_str = @delivery_hour.to_s
    if @delivery_hr_str.length == 1
      @delivery_hr_str.insert(0, "0")
    end
    return "#{@delivery_hr_str}:#{@delivery_min}"
  end

#Look up environment variables -- ENV[....number....]

  private

  def text(x, y)
    account_sid = "AC2e1ac993aca31d47424ddfde7fcf6003"
    auth_token = "99b34c4e6c084558d8d4971002ec2415"
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441288255120' # Your Twilio number
    to = 'y' # Your mobile phone number
    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{x}!"
  )
end


end
