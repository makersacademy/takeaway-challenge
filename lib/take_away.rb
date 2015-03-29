require 'rubygems'
require 'twilio-ruby'

class TakeAway
  attr_accessor :menu, :time
  
  def initialize
    @menu = { "pizza" =>  10, "burger" => 2, "kebab" => 5 }
    interactive_menu
  end

  def interactive_menu
    loop do
      options
      process(STDIN.gets.chomp)
    end
  end

  def options
    puts 'Hi, Welcome to #{self.class?}'
    puts  'Would you like to:'
    puts  '1. View menu'
    puts  '2. Place an order'
    puts  '3. Exit'
  end

  def process(selection)
    case selection
      when '1'
        menu_list
      when '2'
        puts 'Please place order'
        placed_order = gets.chomp.split(' ')
      when '3'
        "Thank you for your business"
        exit
      else
        puts 'Sorry, I do not understand'
     end
  end

  def order *food, total
    running_total = self.menu.values_at(*food)
    cash = running_total.inject(0) {|sum, num| sum + num}
    if total == cash
        send_text
        puts 'Text has been sent' 
    else
        fail 'Not enough cash'
    end
  end

  def send_text
    puts 'What is your phone number?'
    phone = gets.chomp
      account_sid = 'ACb3801603d17adeb2e8217f79a9b4adb1'
      auth_token = 'b5062eb6c0f3df7d4423a89ba71b778b'
      @client = Twilio::REST::Client.new account_sid, auth_token
      text = "Order Received! Food should be with you by #{time.hour + 1}:#{time.min} #{time.meridian}.I hope you enjoy your food!"
      message = @client.account.messages.create(:body => text,
        :to => phone,     # Replace with your phone number
        :from => "+441757322063")   # Replace with your Twilio number
      
      puts message.sid
  end

  def time 
    current_time = Time.now
       hour = (current_time.strftime('%H')).to_i
       min = (current_time.strftime('%I')).to_i
       meridian = current_time.strftime('%p')
  end
end 
