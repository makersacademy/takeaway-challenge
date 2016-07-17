require 'dotenv'
Dotenv.load

class TakeAway

  attr_accessor :menu, :basket, :basket_total

  def initialize
    @basket = []

    @menu = {
      :wonton_soup => 2.99,
      :spring_roll => 2.99,
      :kung_po => 5.99,
      :fried_squid => 6.99,
      :chow_mein => 9.99,
      :roasted_duck => 9.99
    }
  end

  def order(dish, number=1)
    new_dish = @menu.select {|k, v| k==dish}
    add_order(new_dish, number)
    "#{number}x #{dish}(s) added to your basket."
  end

  def see_menu
    @menu
  end

  def see_basket
    @basket
  end

  def basket_total
    basket_prices = @basket.flat_map(&:values)
    @basket_total = basket_prices.reduce { |sum, price| sum + price }
  end

  def basket_summary
    basket_total
    "Total = £#{@basket_total}, Basket = #{@basket}"
  end

  def checkout(amount)
    raise "Please pay the correct amount of £#{@basket_total}." if !is_correct?(amount)
    message = "Thank you for your payment of £#{amount}." +
    " Your food will be delivered before #{delivery_time}."
    send_text(message)
  end

  def send_text(message)
    require 'rubygems'
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['TWILIO_MY_NUMBER'],
      body: message
      )
    message
  end

  def delivery_time
    time = Time.now + (60 * 60)
    time.strftime('%H:%M')
  end

  private

  def add_order(new_dish, number)
    number.times{@basket.push(new_dish)}
  end

  def is_correct?(amount)
    amount == @basket_total
  end

end
