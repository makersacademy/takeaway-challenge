require_relative 'dish_manager'
require_relative 'order'

class RequestHandler
  attr_reader :body, :from

  @@dish_manager = DishManager.new('menu.txt')

  def initialize(params)
    @body = params['Body']
    @from = params['From']
  end

  def response
    case @body.lines.first.chomp.downcase
    when 'menu'
      "Menu:\n" + @@dish_manager.pretty_string
    when 'make order'
      order = @body.lines.to_a[1..-1].join
      make_order(order)
    else
      'Type \'menu\' to view the menu'
    end
  end

  private

  def make_order(order_body)
    order = Order.new
    order_body.lines.each do |line|
      if !line.include? '£'
        data = line.chomp.split(' x ')
        quantity = data.first.chomp.to_i
        dish = @@dish_manager.find_dish_by_name(data.last.chomp)

        order.add(dish, quantity)
      end
    end

    if order.total == order_body.lines.last.split('£').last.chomp.to_f
      "Thank you! Your order was placed and will be delivered before #{order.delivery_by}"
    else
      "Your total does not match, it should be £#{'%.2f' % order.total}"
    end
  end
end