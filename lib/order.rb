require 'twilio-ruby'

class Order

  attr_reader :options
  attr_accessor :current

  def initialize(options)
    @options = options
    @current = {}
  end

  def total
    calculate_total
    display_order
  end

  def place_order(current, expected_total)
    calculate_total
    raise"Sorry mate- but your total is actually #{@total}" if expected_total != @total
    confirmation_text
  end

  def choose(dish, quantity)
    raise "Sorry mate- #{dish} is not on the menu!" unless on_menu?(dish)
    @current[dish] = quantity
    @current
  end

  private

  def on_menu?(dish)
    @options.include?(dish)
  end

  def calculate_total
    @total = 0
    @current.each {|key, value| @total += value * @options[key] }
  end

  def display_order
    string = ''
    @current.each {|key, value| string += "#{value} #{key}s at £#{'%.2f' % @options[key]} each." + "\n" }
    string += "Your total is: £#{'%.2f' % @total}."
  end

  def confirmation_text
    # Get your Account Sid and Auth Token from twilio.com/user/account
    account_sid = 'AC09c3f33609c1212163f034b3b06d8bab'
    auth_token  = '3a16956dbda9c2074cbcba205fc514bb'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.messages.create(:body => "Hey! Thanks for choosing chuck's sub shop! You've ordered #{display_order} It will be delivered before #{Time.now + 10*60*60}",
        :to => "+4407340207478",     # Replace with your phone number
        :from => "+441212854805")   # Replace with your Twilio number
    puts message.sid
  end
end
