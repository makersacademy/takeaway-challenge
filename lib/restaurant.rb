require 'dotenv/load'
require 'twilio-ruby'

class Restaurant

  MENU = { "chips" => 2,
    "mystery chicken" => 4,
    "darlas dirty rice" => 2,
    "chow mein" => 3,
    "dumplings" => 3,
    "pan galactic gargle blaster" => 314159,
    "crispy ducklings" => 2,
    "chish 'n' fips" => 1,
    "spring rolls of sorrow" => 2 }

  attr_reader :menu, :basket, :subtotal

  def initialize
    @menu = MENU
    @basket = []
    @subtotal = []
  end

  def read_menu
    puts "Dastardly Dave's Delightful Dishes"
    @menu.each { |name, price| p "#{name.capitalize} - £#{price}" }
  end

  def order(dish, amount)
    if dish_available?(dish)
      amount.times {@basket << dish}
      return "Added #{amount} #{dish}(s) to your order."
    else
      return "We are all out of #{dish}(s)! What else would you like?"
    end
  end

  def basket_summary
    get_total
    b = Hash.new(0)
    @basket.each { |v| b[v] += 1 }
    b.each { |name, qty| p "#{name.capitalize} x #{qty}" }
    p "subtotal £#{@subtotal.flatten.inject(:+)}"
  end

  def place_order(total)
    if total == @subtotal.flatten.inject(:+)
      send_sms
      return "Thank you! Your order was placed and will be delivered in the next 30 minutes."
    else
      return "Please pay the exact total to place your order."
    end
  end

  private

  def get_total
    @basket.each { |dish| @subtotal << @menu.values_at(dish) }
    @subtotal.flatten.inject(:+)
  end

  def dish_available?(dish)
    @menu.has_key?(dish)
  end

  def correct_amount?(amount)
    amount == @subtotal.flatten.inject(:+)
  end

  def send_sms
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
      )

    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['CUSTOMER_PHONE_NUMBER'],
      body: "Thank you! Your order was placed and will be delivered in the next 30 minutes."
    )
  end

end
