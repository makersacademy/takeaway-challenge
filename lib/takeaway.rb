require_relative "menu"
require_relative "order"
require_relative 'twilio'

class Takeaway
  include Twilio
  attr_reader :menu, :order_system

  def initialize
    @menu = Menu.new
    @order_system = OrderSystem.new(@menu)
  end

  def show_menu
    menu.print_menu
  end

  def order(item, quantity_needed)
    order_system.place_order(item, quantity_needed)
  end

  def show_order
    order_system.order_list.each { |item|  puts "#{item[1][0]} x #{item[0]} £#{item[1][1]}" }
  end

  def show_total
    puts "Total price of delivery is: £#{order_system.total_order}"
  end

  def confirm(amount)
    raise "Order was not placed because doesn't match the total." if order_system.total_order != amount
    send_message
  end

  private

  def delivery_time
    @time = Time.new
    @time += 40 * 60
  end

  def send_message
    delivery_time
    puts 'Please enter your phone number to receive delivery updates(e.g.:44xxxx):'
    client_phone_number = gets.chomp
    client.account.messages.create({
      from: "+441740582009",
      to:   client_phone_number,
      body: "Thank you for your order! Delivery will arrive before #{@time.strftime("%H:%M")} today."
    })
  end

end
