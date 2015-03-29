require 'twilio-ruby'

class Restaurant
  def initialize(*dishes)
    @menu = dishes
  end

  def show_menu
    formatted_menu = ""
    menu.each_with_index do |item, index|
      formatted_menu += "#{index + 1}. #{item.name} - £#{item.price}\n"
    end
    formatted_menu.chomp
  end

  def receive_order(customers_order)
    customers_total = customers_order[:total]
    fail "wrong total" if customers_total != calculated_total(customers_order)
    send_sms(customers_order)
  end

  private

  attr_reader :menu

  def send_sms(customers_order)
    time = Time.now
    setup_twilio
    @client.account.messages.create(
      from: '+441412806117',
      to: customers_order[:from].phone,
      body: "Thanks for your order #{customers_order[:from].name}, we're starting it now, hope to be with you around #{time.hour + 1}:#{time.min}")
  end

  def calculated_total(customers_order)
    calculated_total = 0
    customers_order[:items].each do |dish, quanity|
      calculated_total += menu[dish - 1].price * quanity
    end
    calculated_total.round(2)
  end

  def setup_twilio
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end