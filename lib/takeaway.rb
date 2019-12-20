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
    account_sid = 'ACXXXXXXXXXX'
    auth_token = 'XXXXXXX'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: 'XXXXXXX',
      to: '+XXXXXXXX',
      body: 'Thank you! Your order was placed and will be delivered before 3:55'
    )
  end
end
