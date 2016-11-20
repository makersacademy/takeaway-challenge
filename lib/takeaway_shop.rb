require "rubygems"
require "twilio-ruby"

class TakeawayShop

  attr_reader :menu, :customer

  def take_order( order )
    @customer = order
    @order_time = Time.now
  end

  def confirm_order
    order_details
  end

  def send_text
    account_sid = "AC98d4d8428ec27f9c5e9c52ade6acbd57"
    auth_token = "3572043c9ef43ce6e26fd44136962f93"
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = "+441278393079"
    to = "#{ @customer.phone }"
    client.account.sms.messages.create(
      :from => from,
      :to => to,
      :body => "Thank you! Your order was placed and will be delivered before #{ @order_time.hour + 1 }:#{ @order_time.min }"
    )
  end

private

  def order_details
    total_price = 0
    #items when order is more then 2, item when order is only one.
    @customer.order.size > 1 ? s = "s" : s = ""
    puts "You've orderd #{ @customer.order.size } item#{s}."
    puts "----------------------"

    #show items which the customer ordered
    (@customer.order).each do |item|
        puts "#{ item }  £#{ @menu[item] }"
        total_price += @menu[item]
    end
    "[ total: £#{ total_price } ]"
  end

end
