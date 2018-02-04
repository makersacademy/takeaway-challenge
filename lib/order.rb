require 'twilio-ruby'

class Order

  attr_reader :current

  def initialize
    @current = Hash.new(0)
    @total_cost = 0 # calculated when #calculate_total is run
  end

  def note_down(menu_options)
    loop do
      selection = note_selection
      break if selection.empty?
      raise "We don't have that here, try something else." if !menu_options.include?(selection.downcase)
      quantity = note_down_quantity
      @current[selection] = quantity
    end
  end

  def print_verification(menu_options)
    puts "You ordered:"
    print_quantity_strings(menu_options)
    puts total_cost_to_string(menu_options)
  end

  def send_verification_text
    user_phone_number = get_phone_number
    message = "Thank you for your order costing £#{@total_cost}. Expect it to arrive at #{Time.now.hour + 1}:#{Time.now.min}"
    run_twilio(user_phone_number,message)
  end

  private

  def note_selection
    puts "What would you like to order? Press return when you are finished."
    selection = gets.chomp
    selection.gsub(/\s+/, "_").downcase.to_sym
  end

  def note_down_quantity
    puts "How many would you like?"
    quantity = gets.chomp.to_i
  end

  def print_quantity_strings(menu_options)
    @current.each do |item,quantity|
      puts "#{quantity} x #{item.to_s.gsub("_"," ")}(s) - £#{menu_options[item]} each"
    end
  end

  def total_cost_to_string(menu_options)
    calculate_total(menu_options)
    "Total cost: £#{@total_cost}"
  end

  def calculate_total(menu_options)
    @current.each do |item, quantity|
      @total_cost += menu_options[item] * quantity
    end
  end

  def get_phone_number
    puts "Enter your phone number:  \n0"
    number = gets.chomp
    number = "+44" + number
  end

  def run_twilio(user_phone_number, message)
    account_sid = "AC36e483bbada70a05ac075253130205e2"
    auth_token = "03684a4ecaea26a2c381ad8bd940243e"

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
        body: message,
        to: user_phone_number,
        from: "+441618506928")
  end

end
