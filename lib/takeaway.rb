require_relative 'menu'
require 'twilio-ruby'
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
    message = "Order total is #{total_order_cost}. You expected #{cost}."
    fail message if cost != total_order_cost
    "Your order has been placed!"
  end


  private
  attr_writer :dishes, :total_order
  attr_reader :send_text
  def send_text
    account_sid = 'AC033ff5fd1ab50ecf84e702ae695c4053'
    auth_token = '74465a4227537a433741dd0749629b3a'
    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
    from: ['+441256830268'],
    to: ['+447515356421'],
    body: "Here is the first message from Ruby!"
    )
    puts 'Confirmation SMS sent.'
  end
end
