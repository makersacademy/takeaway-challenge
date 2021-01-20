require_relative 'message'
class Order

  def initialize(number, address)
    @order = Array.new
    @number = number
    @address = address
    @finished? = false
  end

  def add_dish(quantity, dish)
    @order << { quantity: quantity, dish: dish }
  end

  def order_sum
    sum = 0
    @order.each{ |dish_details| sum += dish_details[:quantity] * dish_details[:dish].price }
    sum
  end

  def verify_order
    @order.each{ |dish_details| puts "#{dish_details[:quantity]} x #{dish_details[:dish].name = (dish_details[:dish].price * dish_details[:quantity])}"}
    puts "-- order total = #{order_sum} --"
  end

  def finish_order
    Message.new(@number, "Thank you! Your order was placed and will be delivered before #{Time.new + (60 * 60)}" )
    @finished? = true
  end

end
