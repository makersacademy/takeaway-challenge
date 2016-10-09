#require 'twilio-ruby'
class Restaurant

  attr_reader :order, :total
  attr_accessor :menu, :customer_order_sum

  def initialize
    @order = []
    @menu = []
    @total = 0
  end

  def show_menu
    menu
  end

  def take_orders(order)
    @order << order
    get_price(order)
  end

  def get_price(order)
    order_item_price = order.quantity *  order.food_name.price
    calculate_total(order_item_price)
  end

  def calculate_total(item_price)
    @total += item_price
  end

  def verify_order(customer_order_sum)
    @customer_order_sum = customer_order_sum
  end

  def order_verified?
    customer_order_sum == @total
  end
  def confirm_order
    raise 'Verification failed, sums not matching' if order_verified? == false
    time_of_order = Time.now
    time_of_delivery = (time_of_order + 3600).strftime(" %H:%M")
    sms_confirmation
  end

  private

  def sms_confirmation
  # account_sid = 'ACab16b231b23f5dd790289caff2a2a4c5'
  # auth_token = 'bf18aa8b4b682c58afc1c7d0af19fceb'
  #
  # # set up a client to talk to the Twilio REST API
  # @client = Twilio::REST::Client.new account_sid, auth_token
  #
  # @client.account.messages.create({
  #   :from => '+441202286177',
  #   :to => '+447842659215',
  #   :body => 'This is the ship that made the Kessel Run in fourteen parsecs?'
  # })
  end


end
