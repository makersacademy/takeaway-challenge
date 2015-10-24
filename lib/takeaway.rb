class Takeaway

  CHECKOUT_ERROR = "Total cost entered does not match the sum of your order!"

  attr_reader :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def read_menu
    @menu.dishes.each { |item, cost| print "#{item}: £#{cost}, " }
  end

  def order(item, quantity=1)
    if @menu.dishes[item].nil?
      "#{item} does not exist!"
    else
      @basket[item] += quantity
      "#{quantity}x #{item}(s) added to your basket."
    end
  end

  def basket_summary
    @basket.each do |item, quantity|
      print "#{item} x#{quantity} = £#{(@menu.dishes[item]*quantity).round(2)}, "
    end
  end

  def total_cost
    @total = []
    @basket.each do |item, quantity|
      @total << (@menu.dishes[item]*quantity).round(2)
    end
    "Total Cost: £#{(@total.inject(:+)).round(2)}"
  end

  def checkout(final_cost)
    if its_correct_amount?(final_cost)
      send_text
    else
      raise CHECKOUT_ERROR
    end
  end

  def send_text
    TextMessenger.send_text
  end

  private

  def its_correct_amount?(final_cost)
    final_cost == (@total.inject(:+)).round(2)
  end

end

class TextMessenger

  require 'twilio-ruby'

  account_sid = 'AC2799c29662a04ae8f7eb70faa94e26c9'
  auth_token = '34775ed3445ea0aa68c0734e8be2c829'

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_text
    @client.account.messages.create({
    	:from => '+441873740087',
    	:to => '+447780330410',
    	:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).strftime("%H:%M")}"
    })
  end

end

class Order

end

class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"Spring Roll" => 0.99, "Fried Prawn" => 2.99}
  end

end
