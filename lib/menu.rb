require_relative 'dish'
require_relative 'send_sms'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load('takeaway_environment_variables.env')

class Menu

  DEFAULT_TOTAL = 0
  DEFAULT_PRICE = 1

  attr_reader :dishes
  attr_accessor :selection, :total

  def initialize(total = DEFAULT_TOTAL)
    @dishes = []
    @selection = []
    @total = total
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
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

  def total_price
    total_price = @selection.map {|s| s["price"]}.reduce(0, :+)
  end

  def total_incorrect?
    @total != total_price
  end

  def complete_order
    send_text("Your order was placed and will be delivered before #{in_1_hour}")
  end

  def send_text(message)
    raise "The customer total doesn't match the food price total" if total_incorrect?
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    Twilio::REST::Client.new(account_sid, auth_token)
      @client.messages.create(
        from: ENV['TWILIO_PHONE'],
        to: ENV['MY_PHONE'],
        body: message
      )
  end

end
