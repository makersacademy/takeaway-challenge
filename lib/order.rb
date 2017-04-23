require 'twilio-ruby'

class Order
  DISHES = {
    :carbonara => 6, :pesto => 6.50, :ravioli => 7.50, :tortellini => 8.50, :lasagna => 8.90
  }
  MINIMUM_ORDER = 20

  def initialize
    @my_dishes = []
    @total     = 0
    @my_order  = {}
  end

  def see_dishes
    DISHES
  end

  def add_dish(dish)
    dish = dish.to_sym
    raise "Sorry, dish not found" unless DISHES.has_key?(dish)
    @my_dishes << dish if DISHES.has_key?(dish)
    add_to_my_order(dish)
    @total += DISHES[dish]
    @total
  end

  def remove_dish(dish)
    dish = dish.to_sym
    index = @my_dishes.index(dish)
    @my_dishes.delete_at(index)
    remove_from_my_order(dish)
    @total -= DISHES[dish]
    @total
  end

  def summary
    { order: @my_order, total: @total.round(2) }
  end

  def check_out
    raise "Minimum order is #{MINIMUM_ORDER}." if @total < MINIMUM_ORDER
    account_sid = "AC9d3635a19fddd31127f4b65482b01447" # hide
    auth_token = "5027cc2f218c3b5dd5e13165d48b0f71" # hide
    t = Time.now
    t2 = t + 1 * 60 * 60

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => "Thank you! Your order has been placed and will be delivered before #{t2.strftime("%H:%M")}",
          :to => "+4407456777596",
          :from => "+441732252223")

    puts message.sid
    'Thank you for ordering with us! You will receive a confirmation SMS shortly.'
  end

  private

  def add_to_my_order(dish)
    @my_order[dish] = @my_dishes.count(dish)
  end

  def remove_from_my_order(dish)
    @my_order[dish] -= 1
  end
end
