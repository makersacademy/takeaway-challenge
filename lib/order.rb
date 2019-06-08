class Order

  attr_reader :dishes

  def initialize(time = Time.new, sms)
    @dishes = []
    @time = time
    @sms = sms
  end
  
  def add_dishes(dish, quantity)
    @dishes << { :dish => dish, :qty => quantity }
  end

  def check_total(price)
    total = @dishes.inject(0) do |result, item|
      result + (item[:qty] * item[:dish].price)
    end
    error = "Total given is incorrect. It should be £#{total}"
    return raise error if (total != price)
    true
  end

  def place_order
    delivery_hour = "%02d" % [@time.hour + 1]
    delivery_minute = "%02d" % [@time.min]
    time = delivery_hour + ":" + delivery_minute
    sms_text = "Thank you! Your order was placed and will be delivered before"
    message = "#{sms_text} #{time}"
    @sms.send_sms(message)
  end

end
