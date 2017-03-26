require_relative 'menu'
require 'twilio-ruby'
require 'date'
class Takeaway
  # This class allows you to view and order dishes

  attr_reader :items, :dishes, :total_order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = menu.dishes
    @total_order = []
  end

  def add(item, quantity=1)
    self.total_order += [dishes.select {|k, v| k == item}] * quantity
  end

  def view_dishes
    dishes
  end

  def total_order_cost
    total_order.flat_map(&:values).inject(:+)
  end

  def place_order(cost)
    total_order_cost
    one_hour_ahead = DateTime.now + (1/24.0)
    fail_message = "Order total is £#{total_order_cost}. You expected £#{cost}."
    message = "Thank you! Your order costs £#{total_order_cost} and will be delivered before #{one_hour_ahead.strftime "%H:%M"}"
    fail fail_message if cost != total_order_cost
    send_sms(message)
  end

  def send_sms(message)
    account_sid = 'AC033ff5fd1ab50ecf84e702ae695c4053'
    auth_token = '74465a4227537a433741dd0749629b3a'
    client = Twilio::REST::Client.new account_sid, auth_token
    
    client.messages.create(
    from: ['+441256830268'],
    to: ['+447515356421'],
    body: message
    )

  end

  private
  attr_writer :dishes, :total_order


end
