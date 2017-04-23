require_relative 'menu'
require 'twilio-ruby'

class Restaurant
  attr_reader :menu, :orders

  def initialize
    @menu = {"Battered squid" => 5, "Rump steak" => 16, "Chips" => 2, "Merlot" => 5}
    @total = []
    @orders = []
    @orders_checked = []
  end

  def pretty_print
    @menu.each { |k, v| puts "#{k}: £#{v}" }
  end

  def show_menu
    pretty_print
  end

  def order(item)
    @total << @menu.values_at(item) && @orders << item if @menu.has_key?(item)
    raise "Item not on the menu." if !@menu.has_key?(item)
  end

  def total_price
    @total.flatten.inject(:+)
  end

  def check_total
    @orders.each { |a| @orders_checked << @menu.values_at(a) }
    @orders_checked.flatten.inject(:+)
  end

  def send_text
    account_sid = 'AC30dc5b990ed47dc40d92963328691a89'
    auth_token = '3836dc07ae8ad1dcb7013deffa80468c'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
    :from => '+44 1677 252017',
    :to => '+44 7730474548',
    :body => 'Thank you! Your order was placed and will be delivered before 18:52.',
    )

  end
end
