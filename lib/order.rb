require_relative 'menu'

class Order

  attr_reader :ordered_items, :total_price

  def initialize
    @ordered_items = []
    @total_price = []
  end

  def request_menu
    menu = Menu.new
    menu.list.each { |food, price| puts "#{food} - £#{price}" }
  end

  def add(item)
    selection = Menu.new.list.select { |key| key == item }
    ordered_items << selection.keys[0]
    total_price << selection.values[0]
  end

  def total_order
    total_price.inject { |sum, x| sum + x }
  end

  def order_confirmation
    require 'rubygems'
    require 'twilio-ruby'

    account_sid = 'AC3b1ad07e8cd4535d34644bc14d23d56b'
    auth_token = '0324930a70225d309b4924819b395661'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+441822600013',
      :to => '+447919376807',
      :body => "Thank you for your order! It should be with you by #{Time.new}" })
  end
end