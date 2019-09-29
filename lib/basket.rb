class Basket
  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_item(order)
    index = check_if_already_in_basket(order.dish)
    if index.nil?
      @basket << order
    else
      @basket[index].quantity += order.quantity
    end
    update_total(order.total_price)
    puts "#{order.quantity} #{order.dish} added to your basket"
  end

  def print_basket
    @basket.map { |order|
      puts "#{order.dish} x#{order.quantity} = £#{order.total_price}"
    }
  end

  def check_total
    puts "Total: £#{@total.round(2)}"
  end

  private

  def update_total(price)
    @total += price
  end

  def check_if_already_in_basket(dish)
    @basket.each_with_index { |order, index|
      if order.dish == dish
        return index
      end
    }
    nil
  end

end
