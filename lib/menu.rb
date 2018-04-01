require_relative 'dish'
require_relative 'send_sms'
require 'twilio-ruby'

class Menu

  DEFAULT_TOTAL = 0
  DEFAULT_PRICE = 1

  attr_reader :dishes
  attr_accessor :selection, :total

  def initialize(total = DEFAULT_TOTAL)
    @dishes = []
    @selection = []
    @total = total
  end

  def in_1_hour
    now = Time.now
    starts = now + 3600
  end

  def make_dish(type, price)
    @type = type
    @price = price
    @dish = {"type" => type, "price" => price}
  end

  def add_dish
    @dishes << @dish
  end

  def select_sushi
    @total += DEFAULT_PRICE
    @selection << {"type" => "sushi", "price" => DEFAULT_PRICE }
  end

  def select_laksa
    @total += DEFAULT_PRICE
    @selection << {"type" => "laksa", "price" => DEFAULT_PRICE }
  end

  def select_pizza
    @total += DEFAULT_PRICE
    @selection << {"type" => "pizza", "price" => DEFAULT_PRICE }
  end

  def place_order
  end

  def total_price
    total_price = @selection.map {|s| s["price"]}.reduce(0, :+)
  end

  def total_correct?
    @total == total_price
  end

  def send_message
    account_sid = 'ACdcdde353d226481c3cc28638c6442da7'
    auth_token = '95f4cbb93d6d065bdfd9d46bc1529249'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.api.account.messages.create(
    from: '+447481342537',
    to: '+447934429256',
    body: "Hey there! Your order has been confirmed and will arrive at #{in_1_hour}"
    )
  end

end
