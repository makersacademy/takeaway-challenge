# Twilio functionality successfully integrated but causes all tests to fail as rspec cannot find 'twilio-ruby'. To test functionality, please insert your phone number at line 46 and unhash all commented lines.

# require 'twilio-ruby'

class Takeaway

  DEFAULT_MENU = {Fish: 3, Jelly: 1, Liver: 2, Egg: 1}
  attr_reader :meal

  def initialize(menu = DEFAULT_MENU)
    @menu = DEFAULT_MENU
    @meal = []
    @bill = 0
  end

  def choose(dish)
    @meal << dish
  end

  def display_menu
    @menu.map do |dish, price|
      "#{dish} - £#{price}"
    end.join("\n")
  end

  def running_total
    @meal.each do |dish|
      @bill += @menu[dish.to_sym]
      return "Your bill so far comes to £#{@bill}. Thank you!"
    end
  end

  def checkout
    order_placed = Time.now
    delivery_due = Time.now+3600
    # send_text(order_placed, delivery_due)
    "Your order was placed at #{order_placed}. Your food should be with you by #{delivery_due}." # You may need to comment out this line to test text functionality.
  end

  # def send_text(order_placed, delivery_due)
  #   account_sid = ENV['TWILIO_ACCOUNT_SID']
  #   auth_token = ENV['TWILIO_AUTH_TOKEN']
  #   client = Twilio::REST::Client.new(account_sid, auth_token)
  #   client.messages.create(
  #   from: '+12132386475',
  #   to: '+44XXXXXXXXXX',
  #   body: "Your order was placed at #{order_placed}. Your food should be with you by #{delivery_due}."
  #   )
  # end    

end

# takeaway = Takeaway.new
# takeaway.checkout