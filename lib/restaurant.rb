class Restaurant
  require 'twilio-ruby'

  attr_accessor :menu
  attr_reader :order

  def initialize(menu = { Chicken: 3, Beef: 4 },
    account_sid = 'ACb240a03130d9e88e24f8a9ac0529b12c',
    auth_token = 'cb612ed27a25cdff5214927fee3e3b0f')
    @menu = menu
    @client = Twilio::REST::Client.new account_sid, auth_token
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
      :from => '+447480824831',
      :to => '+447834348935',
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
