require 'twilio-ruby'
require 'dotenv'
Dotenv.load
class Costumer

  attr_reader :basket

  def initialize (menu)
    @basket = {}
    @menu = menu
    @sum = 0
  end

  def add(item, count = 1)
    @sum = 0
    basket[item] = count * menu.show[item]
    basket
  end

  def total
    basket.each_value{|price| @sum += price} if @sum == 0
    @sum
  end

  def pay amount
    fail 'Incorrect amount' if amount != @sum
    send_message
  end

  private
  attr_reader :menu

  def send_message
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    @client.account.messages.create({
            from: '+441243689175',
            to: '+447463797379',
            body: "Thank you! Your order was placed and will be delivered before #{time}"
      })
  end

  def time
    @minute = Time.now.min
    @hour = (Time.now.hour + 1).to_s

    @minute = "0#{@minute}" if @minute < 10

    "#{@hour}:#{@minute}"
  end

end
