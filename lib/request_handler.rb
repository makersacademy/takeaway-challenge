require_relative 'dish_manager'

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

  def make_order(order)
    total = 0
    order.lines.each do |line|
      if !line.include? '£'
        data = line.chomp.split(' x ')
        quantity = data.first.chomp.to_i
        dish = @@dish_manager.find_dish_by_name(data.last.chomp)
        total += dish.price * quantity
      end
    end

    if total.to_f == order.lines.last.split('£').last.chomp.to_f
      time_in_an_hour = Time.now + 3600
      return "Thank you! Your order was placed and will be delivered before #{time_in_an_hour.strftime('%H:%M')}"
    else
      return "Your total does not match, it should be £#{'%.2f' % total}"
    end
  end
end