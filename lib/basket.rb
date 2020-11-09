class Basket

  attr_reader :basket, :basket_val

  def initialize
    @basket = []
    @basket_val = 0
  end

  def add_to_basket(item, quantity, item_price)
    update_basket(item, quantity, item_price)
    "#{quantity}x #{item}(s) added to your basket."
  end

  def summary
    @basket.each do |item|
      $stdout.puts "#{item.keys.join()} x#{item[item.keys.join()][0]} = £#{item[item.keys.join()][1]}"
    end
  end

  def total_value
    @basket_val
  end

  private

  def update_basket(item, quantity, item_price)
    @basket << {item => [quantity, quantity * item_price]}
    basket_value(quantity * item_price)
  end

  def basket_value(price)
    @basket_val += price
  end
end