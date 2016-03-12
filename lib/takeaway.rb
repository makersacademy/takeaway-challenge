require_relative 'menu'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load


class Takeaway

attr_reader :client, :menu

  def initialize
    @menu = Menu.new
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'],ENV['AUTH_TOKEN'])
  end

  def menu
    @menu.menu.dup
  end

  def select_items(order)
    order.map{|key,val| val * menu[key] if menu.key? key}.reduce(:+)
  end

  def place_order(order,total)
    raise "Amount given is not correct" unless total == select_items(order)
    confirm(order)
  end

private

  def confirm(order)
    client.messages.create(
    to: "+447709344456",
    from: "+441233800814",
    body: "Thank you for your order of:\n#{format_order(order)}\nIt will be delivered by #{delivery_time}."
    )
  end

  def format_order(order)
    message = ""
    order.each{|k,v| message << "#{v} x #{k}\n"}
    message.chomp
  end

  def delivery_time
    "#{Time.new.hour + 1}:#{Time.new.min}"
  end


end
