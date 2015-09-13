# require "twilio-ruby"

class Restaurant

  attr_reader :menu, :orders

  def initialize
    @menu = { "starter"=>3, "main"=>6, "drinks"=>2 }
    @orders = {}
  end

  def show_menu
    @menu
  end

  def take_order dish, amount
    @orders[dish] = amount
  end

  def confirm_order total
    fail "Total does not match sum of dish prices" unless total_correct? total
    send_order_confirmation
  end

  def total_correct? total
    total == self.total_calc ? true : false
  end

  def total_calc
    total = 0
    @orders.each do |dish, amount|
      total += @menu[dish] * amount
    end
    return total
  end

  def send_order_confirmation
  #   @client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  #   @client.account.messages.create({:from => '+441143599202', :to => '+447903226001', :body => "Thank you! Your order was placed and will be delivered before #{Time.new + 3600}"})
  end

end
