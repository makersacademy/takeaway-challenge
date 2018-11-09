require_relative 'message_sender'

class Takeaway
  attr_reader :order, :total

  def initialize(message_sender=MessageSender.new)
    @menu = {"Salmon roll" => 5,
             "Tuna roll" => 6,
             "Crab roll" => 7}
    @order = []
    @total = 0
    @message_sender = message_sender
  end

  def display_menu
    puts "Sushi Takeaway Menu"
    @menu.each { |dish, price| puts "#{dish.ljust(15)}£#{price.to_s}" }
  end

  def select(dish,quantity)
    @order << {dish => quantity}
    @total += @menu[dish] * quantity

  end

  def place_order
    # print_order
    send_order_confirmation if confirmed?
  end

  # def print_order
  #   puts "Your order:"
  #   @order.each do |dish_ordered|
  #     dish_ordered.each do |dish, quantity|
  #       puts "#{dish.ljust(12)}"
  #       puts "  £#{(@menu[dish])}ea, x #{quantity.to_s.ljust(7)}£#{@menu[dish]*quantity}"
  #     end
  #   end
  #   puts "#{("Total").ljust(17)}£#{@total}"
  # end

  def send_order_confirmation
    message = "Thank you! Your order was placed and will be delivered before #{delivery_time.to_s}"
    @message_sender.send_message('+447474141665', message)
  end

  private
  def confirmed?
    test_total = 0
    @order.each do |dish_ordered|
      dish_ordered.each do |dish, quantity|
        test_total += @menu[dish] * quantity
      end
    end
    test_total == @total
  end

  def delivery_time
    time = Time.now + (60 * 60)
    time.strftime("%H:%M")
  end

end
