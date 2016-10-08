require_relative 'menu'
require 'twilio-ruby'

class Restaurant

  attr_accessor :order, :menu

  def initialize(menu_class = Menu)
    @order = []
    @menu = menu_class.new
  end

  def display_menu
   @menu.show_menu.each do |k|
     "#{k}"
   end
  end

  def add_to_order(dish, quantity = 1)
    dish = dish.capitalize
    fail "#{dish} isn't available" if dish_check(dish)
     add(dish, quantity)
  end

  def cost
    @cost = @order.inject(0) {|sum, hash| sum + hash[:price]}
    "This order will cost £#{@cost}0"
  end

  def confirm_order(cost)
   fail 'Please enter the correct amount' unless @cost == cost
   send
  end

  private

  def send
    account_sid = 'AC554ac98c7c138bdff979db865e60d125'
    auth_token = '39b15464a6c26800003b5972fe3898e3'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
    from: '+441202286016',
    to:   '*************', #phone number to send to
    body: "Thankyou, your order will be with you by #{Time.now + 3600}"
    )
    "Thankyou for your order, our chefs are hard at work creating your delicious food!"
  end

  def dish_check(dish)
   !display_menu.any? { |h| h[:name] == dish }
  end

  def add(dish, quantity)
    quantity.times{@menu.show_menu.each do |k, v| if k[:name] == dish
       @order.push(k)
      end
    end
   }
  end


end
