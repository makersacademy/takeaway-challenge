require_relative 'menu'
require_relative 'dish'
require_relative 'order'
require 'twilio-ruby'

class Takeaway

  attr_accessor :menu
  attr_reader :orders
  LINE_WIDTH = 40
  ACCOUNT_SID = 'AC2443e62e2510e55905e8cb3c2d31bb8a'
  AUTH_TOKEN = 'ccc7f3d0b864bad7cca601f1ccbd7808'

  def initialize(menu: Menu.new, order: Order.new)
    @menu = menu
    @orders = [order]
  end

  def show_menu
    print_menu_title
    @menu.dish_list.each { |dish| print_menu_line(dish.name, dish.price) }
  end

  def order(name, quantity = 1)
    @menu.dish_list.each do |dish|
      @orders[0].add(dish, quantity) if dish.name == name.to_sym
    end
  end

  def checkout
    raise RuntimeError, 'Nothing was ordered' if @orders[0].cart == {}
    print_title
    @orders[0].cart.each { |k, val| print_line(k.name, k.price * val, val) }
    print_total
  end

  def pay(sum)
    raise RuntimeError, 'Nothing was ordered' if @orders[0].cart == {}
    raise RuntimeError, 'Payment differ from total' unless sum == orders[0].total
    send_sms
    @orders[0].payed
    @orders.unshift(Order.new)
  end

  def cancel_order
    @orders[0].canceled
    @orders.unshift(Order.new)
  end

  private

  def send_sms
    time = Time.new + 3600
    client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    message = client.messages.create(
      body: 'The order will be delivered before ' + time.strftime("%I:%M %p"),
      to: '+447516988508',
      from: '+441704325004')
    puts message.sid
  end

  def print_menu_line(name, price)
    n = LINE_WIDTH - name.length - price.to_s.length
    puts "#{name}#{'.' * n}#{price}".ljust(LINE_WIDTH)
  end

  def print_menu_title
    str = "- MENU -"
    puts str.center(LINE_WIDTH)
  end

  def print_title
    str = "- CHECKOUT -"
    puts str.center(LINE_WIDTH)
  end

  def print_line(name, price, quantity)
    n = LINE_WIDTH - name.length - price.to_s.length - quantity.to_s.length - 3
    puts "#{name} x #{quantity}#{'.' * n}#{price}".ljust(LINE_WIDTH)
  end

  def print_total
    puts "#{'-' * (LINE_WIDTH / 2)}"
    puts "Total: #{@orders[0].total}".ljust(LINE_WIDTH)
  end
end
