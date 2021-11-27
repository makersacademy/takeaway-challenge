require 'dotenv/load'
require 'twilio-ruby'

class Order
  attr_reader :items, :total

  def initialize
    @items = []
    @total
  end

  def summary
    @items.each do |item|
      item.each { |name, price| puts "#{name} - £#{price}" }
    end
    true
  end

  def total
    calculate_total
    "Total: #{@total}"
  end

  def complete
    calculate_total
    send_text("Thank you for your order: £#{@total}")
  end

  def send_text(message)
    account_sid = 'AC4bce300a46726464d43d6ef4c4051cf5' 
    auth_token = ENV['AuthToken'] 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 

    message = @client.messages.create(   
      body: message,
      messaging_service_sid: 'MGc6ed9a1f11afc694b64b2ce6341d0019',      
      to: ENV['SECRET_NUMBER'] 
    ) 

    puts message.sid
  end

  private
  def calculate_total
    @total = @items.reduce(0) { |total, item| total + item.values.last}
  end
end