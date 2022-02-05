class Takeaway

  attr_reader :menu
  attr_reader :order

  def initialize
    @menu = {chips: 3, burger: 4, pastie: 5}
    @order = []
    @total = 0
  end

  def add_to_order(item, quantity)
    quantity.times {
      @order.push(item)
      @total = @total + @menu[item.to_sym]
    }

    puts "Your order is: #{@order}"
    puts "Your total is: £#{@total}"
  end

  def is_total_correct?(total)
    count = 0

    @order.each {
      |item|
      count = count + @menu[item.to_sym]
    }

    if total == count 
      true
    else
      false
    end

  end

end