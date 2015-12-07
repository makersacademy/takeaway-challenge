require_relative 'sms'

class Order

  DEFAULT_QUANTITY = 1

  attr_reader :basket, :sms_client

  def initialize(sms_client = Sms.new)
    @basket = {}
    @sms_client = sms_client
  end

  def add(dish, quantity = DEFAULT_QUANTITY)
    quantity = @basket[dish] + quantity if @basket[dish]
    @basket[dish] = quantity
  end

  def remove(dish)
    fail 'Dish not in basket' unless @basket[dish]
    quantity = @basket[dish]
    if quantity > 1
      @basket[dish] = quantity-1
    else
      @basket.delete(dish)
    end
  end

  def view
    @basket.each do | dish, quantity|
      puts "#{quantity}x #{dish.name} = #{dish.price * quantity}"
    end
  end

  def total
    total = 0
    basket.each do |dish, quantity|
      total += dish.price * quantity
    end
    total
  end

  def confirm(phone_number)
    @sms_client.send(message, phone_number)
  end

  private
  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

  def message
    "Thank you! Your order was placed and will be delivered by #{delivery_time}"
  end

end
