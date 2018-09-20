require 'twilio-ruby'

class Takeaway
  attr_reader :order, :total

  def initialize
    @menu = {
      "fish and chips" => 3.20, 
      "burger and chips" => 4.20, 
      "chips" => 1
    }
    @order = {}
    @total = 0
  end
  
  def menu
    @menu.each { |k, v| puts "#{k} - £%.2f" % v }
  end

  def add_meal(meal_selection, quantity)
    item_on_menu?(meal_selection)
    
    @menu.each do |meal, price|
      if meal == meal_selection
        meal = meal + ' x' + quantity.to_s
        price *= quantity
        @order.store(meal, price)
      end
    end
    
    sum_order
  end

  def sum_order
    @total = "£%.2f" % @order.values.inject(:+).to_s
  end
  
  def item_on_menu?(item)
    fail "Sorry that is not on the menu" unless @menu.has_key?(item)
  end
  
  def place_order
    account_sid = 'AC878acd04f5f48bec769574ff5a0b1e97'
    auth_token = '7d2b38d4b879d50c61b3d002614660ab'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447449672445' # Your Twilio number
    to = '+447905659510' # Your mobile phone number
    now = Time.new
    one_hour = now + 3600

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your ordered was placed. You have ordered #{@order}. The total for your order is: #{@total}. Your order will will be delivered before #{one_hour.strftime("%d of %B, %Y —  %H:%M")}"
    )
  end
end 
