require_relative "menu"
require_relative "order_system"
require_relative "my_twilio"

class Takeaway
  include MyTwilio

  attr_reader :menu, :order_system

  def initialize
    @menu = Menu.new
    @order_system = OrderSystem.new(@menu)
  end

  def show_menu
    menu.print_menu
  end

  def order(item, quanitity)
    order_system.place_order(item, quanitity)
  end

  def show_order
    order_system.order_list.each do |item|
      puts "#{item[1][0]} x #{item[0]} £#{item[1][1]}"
    end
  end

  def show_total
    puts "Total: £#{order_system.order_total}"
  end

  def confirm(amount)
    raise "Does not match total, order not placed" if order_system.order_total != amount
    send_message
  end

  private

  def send_message
    @time = Time.new
    @time += 30 * 60
    client.account.messages.create({
      from: "447400376220",
      to: "4407852878326",
      body: "Thank you! Your order was placed and will be delivered before #{@time.strftime("%H:%M")}"
    })
  end

end
