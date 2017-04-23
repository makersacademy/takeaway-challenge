require_relative 'text_notifier.rb'

class Order
  DISHES = {
    :carbonara => 6, :pesto => 6.50, :ravioli => 7.50, :tortellini => 8.50, :lasagna => 8.90
  }.freeze

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
    @total.round(2)
  end

  def remove_dish(dish)
    dish = dish.to_sym
    index = @my_dishes.index(dish)
    @my_dishes.delete_at(index)
    remove_from_my_order(dish)
    @total -= DISHES[dish]
    @total.round(2)
  end

  def summary
    { order: @my_order, total: @total.round(2) }
  end

  def check_out
    raise "Minimum order is #{MINIMUM_ORDER}." if @total < MINIMUM_ORDER
    send_sms_confirmation
    'Thank you for ordering with us! You will receive a confirmation SMS shortly.'
  end

  private

  def sms_confirmation_body
    time = Time.now + 3600
    body = "Thank you! Your order has been placed and will be delivered before #{time.strftime("%H:%M")}"
  end

  def send_sms_confirmation
    recipient = "+4407456777596"
    TextNotifier.send_sms(recipient, sms_confirmation_body)
  end

  def add_to_my_order(dish)
    @my_order[dish] = @my_dishes.count(dish)
  end

  def remove_from_my_order(dish)
    @my_order[dish] -= 1
  end
end
