###
require_relative 'menu'
require_relative 'twilio'

class Order

  # more commonly known as half an hour
  PROCESSING_TIME = 1800

  def initialize(menu_instance = Menu.new)
    @contents = {}
    @menu = menu_instance
  end

  def add(item, quantity)
    @contents[item] = quantity
  end

  def message
    "You ordered #{contents_formatted}. Your total comes to £#{calculate_total}.
    Your order will be delivered at #{calculate_time}"
  end

  def complete(messaging_client = TwilioSender)
    messaging_client.new.send(message)
  end

  private

  def calculate_total
    @contents.map { |item, quantity| @menu.items[item] * quantity }.inject(:+)
  end

  def contents_formatted
    @contents.map { |item, quantity| "#{quantity} #{item}s" }.join(", ")
  end

  def calculate_time
    require 'date'
    time = Time.now + PROCESSING_TIME
    time.strftime("%H:%M")
  end

end
