class Order

attr_reader :ordered_items, :menu, :total_price

  def initialize
    @ordered_items = []
    @total_price = []
    @menu = { pizza: 11,
              salad: 6,
              hotdog: 5,
              pasta: 7,
              chicken: 8 }
  end

  def request_menu
    menu.each { |food, price| puts "#{food} - £#{price}" }
    end

  def add(item)
    selection = menu.select { |key| key == item }
    ordered_items << selection.keys[0]
    total_price << selection.values[0]
  end

  def total_order
    total_price.inject { |sum, x| sum + x }
  end

 def order_confirmation
  require 'rubygems'
  require 'twilio-ruby'

  account_sid = 'AC3b1ad07e8cd4535d34644bc14d23d56b'
  auth_token = '0324930a70225d309b4924819b395661'

  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => '+441822600013',
    :to => '+447919376807',
    :body => 'Thank you for your order! It should be with you by 10:30' })
end
end