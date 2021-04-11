require_relative 'menu'
require_relative 'send_sms'
class Order
  attr_reader :menu, :selection, :sms

  def initialize(menu = Menu.new, sms = SendSms.new)
    @menu = menu
    @selection = {}
    @sms = sms
  end 

  def see_menu
    @menu.read_menu
  end 

  def place_order(item, amount)
    raise "#{item} is not on the menu today" unless @menu.dish?(item)

    @selection[item.to_sym] = amount
    return "#{amount}x #{item}(s) added to basket = £#{@menu.price(item) * amount}"
  end 

  def total
    "Your order total is: £#{item_totals.inject(:+)}"
  end

  def confirm_order
    send(delivery_time)
  end 

  private 
  def item_totals
    @selection.map do |item, amount|
      @menu.price(item) * amount
    end 
  end 

  def send(delivery_time)
    client = Twilio::REST::Client.new(@sms.account_sid, @sms.auth_token)
    client.messages.create(
    from: @sms.from,
    to: @sms.to,
    body: "Your order is being prepared, it will arrive by #{delivery_time}"
    )
    "A confirmation text should be with you shortly"
  end 

  def delivery_time
    Time.now + 3600
  end 
end 
