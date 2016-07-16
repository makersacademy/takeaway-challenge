class TakeAway
  require_relative "twilio-test"
  attr_accessor :dish_list

  def initialize
    @dish_list= {"Pizza Tuna" => 7,
                  "Pizza Johannesburg" => 8}
  end
  def show_dishes
    @dish_list
  end

  def place_order(dish_one, quantity_one, dish_two, quantity_two, total_price)
    sum = quantity_one * @dish_list[dish_one] + quantity_two*@dish_list[dish_two]
    raise "given total price does not equal sum of dishes" if sum != total_price
    order_placed_message = "Thank you! Your order was placed and will be delivered before #{current_time} "
    send_sms(order_placed_message)
    order_placed_message
  end

  def current_time
    time1 = Time.new
    time2 = time1.min
    time3 = "#{time1.hour+1}"+":"+"#{time2}"
  end

end
