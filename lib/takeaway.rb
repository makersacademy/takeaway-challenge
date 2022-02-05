class Takeaway

  attr_reader :menu
  attr_reader :order

  def initialize
    @menu = { chips: 3, burger: 4, pastie: 5 }
    @order = []
    @total = 0
  end

  def add_to_order(item, quantity)
    quantity.times {
      @order.push(item)
      @total += @menu[item.to_sym]
    }

    puts "Your order is: #{@order}"
    puts "Your total is: £#{@total}"
  end

  def total_correct?(total)
    count = 0

    @order.each {
      |item|
      count += @menu[item.to_sym]
    }

    total == count
  end

  def place_order
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
