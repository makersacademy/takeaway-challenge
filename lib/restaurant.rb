require 'twilio-ruby'


class Restaurant

  attr_reader :menu
  attr_accessor :basket
  attr_reader :total
  attr_accessor :sms_menu

  def initialize
    @menu = { "spring roll" => 0.99, "char sui bun" => 3.99,
      "pork dumpling" => 2.99, "peking duck" => 7.99,
      "fu-king fried rice" => 5.99 }
    @basket = []
    @total = 0
    @sms_menu = ""
  end

  def display_menu
    count = 1
    @menu.each do | dish, price |
      line = sprintf '%0s %1s %1s %10s %0s', count.to_s, "-", dish.ljust(18), "£", price.to_s
      puts line
      @sms_menu << line << "\n"
      count += 1
    end
    puts sprintf '%30s', "\n\nTOTAL order £#{@total.round(2)}"

  end

  def choose_dish
    user_selection = nil
    while user_selection != "0" do
      system("clear")
      display_menu
      puts "\nEnter the dish's number"
      user_selection = gets.chomp
      add_to_basket(Integer(user_selection) - 1)
    end
  end

  def add_to_basket(selection)
    while selection >= 0 do
      dish = @menu.keys[selection]
      price = @menu.values[selection]
      @basket << {dish => price}
      @total += @menu.values[selection]
    end
  end

  def display_basket
    @basket.each do | item |
      puts "#{item.keys[0]} --- #{item.values[0]}"
    end
    puts "\nTOTAL = £#{@total = @total.round(2)}"
  end

  def sms_confirmation
    account_sid = "ACc6f40f795f5e616eddbe67ee2ae9f1b0" # Your Account SID from www.twilio.com/console
    auth_token = "65c7256479d56fba835e10c719de806d"   # Your Auth Token from www.twilio.com/console
    time = Time.new

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.strftime("%M")}",
        to: "+#{mobile_number}",    # Replace with your phone number
        from: "+447480619321")  # Replace with your Twilio number

    puts message.sid
  end

  def sms_output
    account_sid = "ACc6f40f795f5e616eddbe67ee2ae9f1b0" # Your Account SID from www.twilio.com/console
    auth_token = "65c7256479d56fba835e10c719de806d"   # Your Auth Token from www.twilio.com/console

    count = 1
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: @sms_menu,
        to: "+447534057767",    # Replace with your phone number
        from: "+447480619321")  # Replace with your Twilio number

    puts message.sid
  end

  def sms_input

  end

end
