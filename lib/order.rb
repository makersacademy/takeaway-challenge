require_relative 'menu'
require_relative 'twilio'
class Order

  attr_reader :items, :total

  def initialize
    @items = []
    @total = 0
    @menu = Menu.new
    @text = Text.new
  end

  def input_items(order = '')
    raise "No items in the order!" if order == ''
    @items = @menu.select(read_order(order))
  end

  def verify_total
    total = verification
    raise "Total does not match the sum of the prices!" unless @total == total
  end

  def order_complete(permission = true)
    send_text(permission)
  end

  private

  def read_order(order)
    items = order.split(', ')
    @total = items.pop.to_f
    items.map { |item| [item.split[0..-2].join(' '), item.split[-1].to_i] }
  end

  def verification(total = 0)
    @items.each do |item|
      price = 0
      @menu.dishes.each { |menu_item| price = menu_item[:price] if menu_item[:name] == item[:name] }
      total += price * item[:quantity]
    end
    total
  end

  def time
    hour = "#{(Time.now.hour + 1) % 24}"
    hour = '0' << hour if hour.length == 1
    min = "#{Time.now.min}"
    min = '0' << min if min.length == 1
    "#{hour}:#{min}"
  end

  def send_text(permission)
    order_string = @items[0..-2].map { |item| "#{item[:quantity]} x #{item[:name]}" }.join(', ') << " and #{@items[-1][:quantity]} x #{@items[-1][:name]}"
    message = "Thank you! Your order of #{order_string} was placed and will be delivered before #{time}"
    return "Thank you! Your order of #{order_string} was placed and will be delivered before #{time}" unless permission
    @text.send_text(message) if permission
  end
end
