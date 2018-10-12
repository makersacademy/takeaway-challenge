require_relative 'apis/twilio'

class Order

  def initialize(dishes:, bill:)
    @dishes = dishes
    @bill = bill
  end

  def check_bill
    bill = (@dishes.map { |dish, quantity| dish.price * quantity }.reduce(:+)).round(2)
    raise 'Incorrect Bill' if @bill != bill
    now = Time.now
    delivery_time = "#{ now.hour + 1 }:#{ now.min }"
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    send_text(message)
  end

end
