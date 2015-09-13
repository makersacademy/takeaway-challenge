require 'twilio-ruby'
require './.env.rb'

class Order 

  attr_reader :total, :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0.0
  end

  def check_dishes
    list_of_dishes = ''
    menu.dishes_available.each do |dish, price|
      list_of_dishes += "#{dish} £#{price}\n"
    end
    list_of_dishes
  end

  def add_item(dish, quantity = 1)
    fail 'That item is not on the menu' unless menu.dishes_available.key?(dish)
    dish_check_and_add(dish, quantity)
    price = quantity * menu.dishes_available[dish].round(2)
    @total += price.round(2)
  end

  def remove_item(dish, quantity = 1)
    fail 'Item was not in the basket' unless basket.include?(dish)
    fail 'You do not have that quantity of the item in the basket' if quantity > basket[dish]
    quantity_check_and_remove(dish, quantity)
    price = quantity * menu.dishes_available[dish].round(2)
    @total -= price.round(2)
  end

  def total_price_verified?
    basket_total = 0.0
    basket.each do |dish, quantity|
      basket_total += quantity * menu.dishes_available[dish].round(2)
    end
    basket_total.round(2) == total ? true : false
  end

  def place_order
    fail 'Basket is empty' if basket.empty?
    fail 'The total price has been miscalculated' unless total_price_verified?
    send_message
    "Thank you for your order. You will receive text confirmation shortly"
  end

  private 

  def dish_check_and_add(dish, quantity)
    basket.key?(dish) ? basket[dish] += quantity : basket[dish] = quantity
  end

  def quantity_check_and_remove(dish, quantity)
    basket[dish] == quantity ? basket.delete(dish) : basket[dish] -= quantity
  end

  def send_message
    @account_sid = ENV[:account_sid]
    @auth_token = ENV[:auth_token]
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.messages.create(
      from: '441246488347',
      to: ENV[:phone_number],
      body: "Thank you. Your order has been placed successfully and will be with before #{calculate_delivery_time}. The total cost is £#{total.round(2)}",
    )
  end

  def calculate_delivery_time
    @time = Time.now
    @hour = @time.hour + 1
    @minute = @time.min
    @time_1hour = @hour.to_s + ":" + @minute.to_s
    @time_1hour
  end


end