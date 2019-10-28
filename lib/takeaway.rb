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
    # send_text
    "Your order was placed at #{order_placed}. Your food should be with you by #{delivery_due}."
  end

=begin  def send_text
    account_sid = 'AC4995904c0d2228dd292ab79c3f9d87b4'
    auth_token = '00c1e996d823f81558e1b27afa7b2ec8'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create(
    from: '+12132386475',
    to: '+447391405893',
    body: "Your order was placed at #{order_placed}. Your food should be with you by #{delivery_due}."
    )
  end
=end    

end