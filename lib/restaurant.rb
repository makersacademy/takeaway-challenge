class Restaurant
  require 'twilio-ruby'
  require 'csv'

  attr_accessor :menu
  attr_reader :order

  def initialize(menu = { Chicken: 3, Beef: 4 },
    account_sid = CSV.read('./lib/twilio.csv')[0],
    auth_token = CSV.read('./lib/twilio.csv')[1])
    @menu = menu
    @client = Twilio::REST::Client.new account_sid[0], auth_token[0]
    @from = CSV.read('./lib/twilio.csv')[2]
    @to = CSV.read('./lib/twilio.csv')[3]
  end

  def print_menu
    menu.each { |k, v| puts "#{k}: £#{v}" }
  end

  def place_order(*dishes)
    @order = []
    menu_check(*dishes)
    dishes.each { |dish| @order << dish }
    print_order
  end

  def order_total
    total = 0
    order.each { |item| total += @menu[item.to_sym] }
    return total
  end

  def menu_check(*dishes)
    dishes.each do |dish|
      raise "#{dish} is not on the menu" unless @menu.key?(dish.to_sym)
    end
  end

  def send_sms
    delivery_time = Time.new + 1 * 60 * 60
    @client.messages.create(
      :from => @from[0],
      :to => @to[0],
      :body => "Thank you! Your order was placed and will be delivered
      before #{delivery_time.strftime("%H:%M")}")
  end

  private
  def print_order
    puts "Your order:"
    order.each { |item| puts "#{item}: £#{@menu[item.to_sym]}" }
    puts "TOTAL: £#{order_total}"
  end

end
