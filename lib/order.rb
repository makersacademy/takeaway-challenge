class Order
  attr_reader :basket, :menu, :sms
  
  def initialize(menu, account_sid, auth_token, from_num, to_num)
    @basket = Basket.new(menu)
    @menu = menu
    @sms = SMS.new(account_sid, auth_token, from_num, to_num)
  end

  def add(dish, quantity = 1)
    @basket.add(dish, quantity)
  end 

  def remove(dish, quantity = 1)
    @basket.remove(dish, quantity)
  end

  def total
    @basket.total
  end

  def summary
    @basket.summary
  end

  def pay(amount)
    raise "Payment amount incorrect" if amount != total

    puts "Payment of £#{amount} successful. You will receive a cofirmation SMS shortly."
    @sms.send
  end
end
