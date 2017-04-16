require 'rubygems'
require 'twilio-ruby'

class TakeAway
  attr_accessor :menu, :time, :name
  
  def initialize(name)
    @menu = { 'pizza' => 10, 'burger' => 2, 'kebab' => 5 }
    interactive_menu(name)
    @name = name
  end

  def interactive_menu(name)
    loop do
      options(name)
      process(STDIN.gets.chomp)
    end
  end

  def options(name)
    puts "Hi, Welcome to #{name}"
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
        placed_order = gets.chomp.split
        puts 'Payment?'
        total = gets.chomp.to_i
        order(*placed_order, total)
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
        puts 'Thank you for Ordering' 
    else
        fail 'Not enough cash'
    end
  end

  def menu_list
    self.menu.each do |key, value|
      puts "#{key}: £#{value},"
    end
  end

  def send_text
    puts 'What is your phone number?'
    phone = gets.chomp
      account_sid = 'ACb3801603d17adeb2e8217f79a9b4adb1'
      auth_token = 'b5062eb6c0f3df7d4423a89ba71b778b'
      @client = Twilio::REST::Client.new account_sid, auth_token
      time = Time.now
       hour = (time.strftime('%H')).to_i
       min = (time.strftime('%I')).to_i
       meridian = time.strftime('%p')
      text = "Order Received! Food should be with you by #{hour + 1}:#{min} #{meridian}.I hope you enjoy your food!"
      message = @client.account.messages.create(:body => text,
        :to => phone,
        :from => "+441757322063")
      puts message.sid
  end
end 
