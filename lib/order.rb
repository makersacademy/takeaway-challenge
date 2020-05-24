require_relative 'formatter.rb'
class Order

  attr_reader :order

  def initialize(formatter = Formatter.new)
    @formatter = formatter
    @order = []
    @total = 0
  end

  def add(item, number = 1)
    @order << { name: item.name, number: number }
    @total += item.price * number
  end

  def show
    @order.each { |item| puts "#{item[:name]}: #{item[:number]}" }
    puts "Total Price: #{@formatter.price(@total)}"
  end

  def confirm
    t = Time.now
    time_string = "#{t.hour + 1}:#{t.min}"
    puts "Order confirmed, it will arrive at #{time_string}"
  end

end
