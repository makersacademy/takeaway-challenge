require 'twilio-ruby'

class Takeaway

  MENU = {
    "ramen" => 8,
    "sushi" => 10,
    "sashimi" => 14,
    "bento" => 18
  }

  attr_reader :bill, :order

  def initialize(menu = MENU)
    @menu = menu
    @order = []
    @bill = 0
  end

  def display_menu
    @menu.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end

  def add_dish(item, quantity = 1)
    quantity.times { @order << item }
  end

  def total
    @order.each do |item|
      @bill += @menu[item]
    end
    "Your order of #{order.count} items comes to a total of £#{@bill}"
  end

  def view_order
    view = @order.each_with_object(Hash.new(0)) { |string, hash| hash[string] += 1 }
    view.each do |item, count|
      puts "#{count} x #{item}: £#{@menu[item]}"
    end
    return total
  end

  def confirm_order
    account_sid = 'AC51ce1f5ee87d8cf24e9fc28e47d49788'
    auth_token = '8b14e35f0332fcd828c1f4465cb80d27'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = #my Twilio number
    to = #customer's number

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{Time.now + 3600}"
    )
  end
end
