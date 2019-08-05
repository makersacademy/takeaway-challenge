require_relative 'takeout'
require_relative 'formatter'

class Order

  attr_accessor :time

  def initialize(menu)
    @takeout = Takeout.new(menu)
    @change = 0
    @formatter = Formatter.new
  end

  def view_menu
    @takeout.menu.each { |item, price| puts "#{item}: £#{price.to_s.insert(2, ".")  }" }
  end

  def view_order
    @takeout.order.each{ |item, number| puts "#{item}(s)x#{number}" }
    puts "current total £#{@formatter.format_change(@takeout.price)}"
  end

  def select(item, number)
    @takeout.order[item] = number
  end

  def place_order(cash, mobile_number)
    if cash >= @takeout.price
      @change += (cash - @takeout.price)
      puts "order placed"
      time = Time.now
      @takeout.confirm_order(mobile_number, @formatter.delivery_time_reformat(time), @formatter.format_change(@change))
    else
      raise 'not enough cash, input in pence!'
    end
  end
end
