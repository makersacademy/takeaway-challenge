require_relative 'dish'
require_relative 'twilio'

class Order
  attr_reader :dishes, :order

  def initialize
    @dishes = Dish.new
    @order = []
  end

  def add(dish, quantity)
    dish -= 1

    @order << [@dishes.dishes[dish][:name],
               quantity,
               @dishes.dishes[dish][:price],
               quantity * @dishes.dishes[dish][:price]]
  end

  def total
    order.map { |line| line[3] }.inject(&:+)
  end

  def print_dishes
    i = 1
    @dishes.dishes.each do |dish|
      puts "#{i}. #{dish[:name].capitalize.ljust(24, '.')} #{dish[:price]}"
      i += 1
    end
  end

  def notify(service = TwilioSMS)
    service = service.new
    message = "Thank you! Your order was placed and will be delivered before " + (Time.now + 60 * 60).strftime("%H:%M")
    service.send(message)
  end
end
