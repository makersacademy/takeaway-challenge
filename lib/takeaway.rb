require_relative 'menu'
require_relative 'order'
require_relative 'message'

class TakeAway

  def initialize(order = Order.new)
    @order = order
    @order_history = []
  end

  def dishes
    menu.each { |item, price| puts "#{item}, price: #{price}€" }
  end

  def select(dish, quantity)
    fail 'No such dish' unless menu.include?(dish.to_sym)
    @order.add(dish, quantity)
  end

  def current_order
    @order.list
  end

  def place_order(total_price)
    fail 'Not correct amount' if total_price != calculate_total
    puts 'That is the correct amount, sending confirmation to your cellphone...'
    confirm_order
  end

  def order_history
    @order_history.dup
  end

  private

  def menu
    Menu.new
  end

  def confirm_order(message = Message.new, t = Time.new + 60 * 60)
    save_and_reset
    message.send("Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!")
  end

  def calculate_total
    sum = 0
    current_order.each { |item, price| sum += menu[item] * price }
    sum
  end

  def save_and_reset
    @order.store_cost(calculate_total)
    @order_history << @order
    @order = Order.new
  end

end
