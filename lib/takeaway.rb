require_relative 'menu'
require_relative 'order'


class TakeAway

  def initialize(order = Order.new)
    @order = order
  end

  def dishes(menu = Menu.new)
    menu.each { |item, price| puts "#{item}, price: #{price}" }
  end

  def select(dish, quantity)
    fail 'No such dish' unless dishes.include?(dish.to_sym)
    @order.add(dish, quantity)
  end

  def current_order
    @order.list
  end

  def place_order(current_order, total_price)
    @total_price = total_price
    fail 'Not correct amount' if incorrect_total?
    confirm_order
  end

  private

  def confirm_order
    t = Time.new + 60 * 60
    "Thank you! Your order will be delivered before #{t.strftime("%H")}:#{t.strftime("%M")}!"
  end

  def incorrect_total?
    @total_price != calculate_total
  end

  def calculate_total
    sum = 0
    current_order.each { |item, price| sum += dishes[item] * price }
    sum
  end

end

# +46769439197
