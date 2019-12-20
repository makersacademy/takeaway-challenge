require_relative 'Menu'
require("bundler")
Bundler.require()


class Takeaway
  attr_reader :basket, :result,:menu

  def initialize
    @basket = []
    @menu = nil
    @total = 0
  end

  def see(menu)
    @menu = menu.list
  end

  def select(item,quantity=1)
    @result = @menu.find { |x| x[item] }
    @basket.concat([@result]* quantity)
    end

  def total
    @basket.each { |x|
      x.each { |key, value|
      @total = @total + value }}
      @total
  end

  def is_amount_correct(total)
    time = Time.now + 1*60*60
    if @total == total
      send_text( "Thank you! Your order was placed and will be delivered before #{time}")
    elsif
      fail "Error"
    end
  end

  def send_text(message)
    account_sid = 'AC95ce3cd8f6b05ca7c3ad0be95882c2c9'
    auth_token = 'b9ada2b73535d110b063116f4a47bd5b'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+13173761339',
      to: '+447519283210',
      body: 'Thank you! Your order was placed and will be delivered before 3:55'
    )
  end
end
