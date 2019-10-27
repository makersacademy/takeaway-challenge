require_relative 'twilio'

class Takeaway

  attr_reader :dishes

  @credentials = {
  "sid" => ENV['TWILIO_SID'],
  "auth_token" => ENV['TWILIO_TOKEN'],
  "number" => ENV['TWILIO_NUM']
  }

  def initialize
    @dishes = { "coffee" => 3.00, "coke" => 2.40,
      "pizza" => 8.50, "chicken" => 9.90,
      "fish" => 7.80, "burger" => 9.50 }
    @basket = []
    @total = []
  end

  def print_menu
    dishes
  end

  def order(dish, quantity)
    @dish = dish
    @quantity = quantity
    @order = dishes[dish], quantity
    @cost = (dishes[dish] * quantity).round(2)
    @total << @cost
    @basket << ["#{@dish} x#{@quantity} = £#{@cost}0"]
    return "#{quantity}x #{dish}(s) has been added to your order"
  end

  def basket_summery
    @basket
  end

  def total
    return "Total: £#{@total.inject(:+)}0"
  end

  def complete_order
    send_text("Thank you for your order: £#{@total.inject(:+)}0")
  end

  def send_text(message)
    @sms = SMS.new(@credentials)
    @sms.send_sms(message)
  end

end
