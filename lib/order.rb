class Order

  attr_reader :order

  def initialize(formatter = Formatter.new)
    @formatter = formatter
    @order = []
    @total = 0
  end

  def add(item, number = 1)
    @order << {name: (item.name), number: number}
    @total += item.price * number
  end

  def show
    @order.each { |item| puts "#{item[:name]}: #{item[:number]}" }
    puts "Total Price: #{@formatter.format(@total)}"
  end

end
