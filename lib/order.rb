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
    total = @dishes.inject(0) { |result, item| result + (item[:qty] * item[:dish].price) }
    if total != price
      raise "Total given is incorrect. It should be £#{total}"
    else
      true
    end
  end

  def place_order
    delivery_hour = "%02d" % [@time.hour + 1]
    delivery_minute = "%02d" % [@time.min]
    delivery_time = delivery_hour + ":" + delivery_minute
    text_message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @sms.send_sms(text_message)
  end

end
