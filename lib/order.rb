require 'twilio-ruby'

class Order
  attr_reader :order_items, :order_total

  def initialize
    @order_items = {}
    @order_total = 0
  end


  def save_items(menu_options)
    loop do
      selection = get_selection
      break if selection.empty?

      raise "We don't currently serve this dish!" if menu_options[selection].nil?
      quantity = get_quantity
      @order_items[selection] = quantity
    end
    'order noted'
  end

  def check_order(menu_options)
    puts "You ordered:"
    summary_of_order(menu_options)
    puts " Total: £#{order_total(menu_options)}"

    'order verified'
  end

  def confirm_order
    puts "Please enter your phone number:"
    user_phone = gets.chomp
    user_phone = "+44" + user_phone
    message = "Thank you for your order, total £#{@order_total}, expect it to arrive at #{Time.now.hour+1}:#{Time.now.min}"
    run_twilio(user_phone, message)

  end


  private

  def get_selection
    puts "What would you like to order? Press return to finish"
    selection = STDIN.gets.chomp
    selection = selection.gsub(/\s+/,'_').downcase.to_sym

  end

  def get_quantity
    puts "How many would you like?"
    quantity = STDIN.gets.chomp.to_i

  end

  def summary_of_order(menu_options)
    @order_items.each do |item, quantity|
    puts " #{quantity} x #{item.to_s.gsub('_', ' ')} - £#{menu_options[item.to_s.gsub(/\s+/, '_').to_sym]} each"
    end
  end

  def order_total(menu_options)
    amounts = []
    @order_items.each do |item, quantity|
      amounts << menu_options[item] * quantity
    end

    amounts.inject(@order_total, :+)

    end

    def run_twilio(user_phone, message)
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']

      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.messages.create(
        body: message,
        to: user_phone,
        from: ENV['TWILIO_PHONE'])

      'SMS sent'

    end
  end
