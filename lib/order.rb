class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @itemised_basket = []
  end

  def itemised_basket
    @itemised_basket.dup
  end

  def select(dish, qty = 1)
    qty.times { @itemised_basket << @menu.pick(dish) }
    @itemised_basket[-1]
  end

  def basket
    @basket = @itemised_basket.inject{|dish, price| dish.merge(price){|qty, price_each, price_total| price_each + price_total}}
    puts @basket
  end

  def qty_tracker
    @qty_tracker = {}
    @basket.each { |key, val| @qty_tracker[key] = fetch_qty(key) }
    @qty_tracker
  end

  def summary
    raise "There are no items in your basket" if @basket == nil
    basket_keys = @basket.keys
    qty_values = @qty_tracker.values
    basket_values = @basket.values
    total = 0
    basket_values.each{|price| total += price}
    i = 0
    puts "Your order:"
      while basket_keys[index] != nil do
        puts "#{qty_values[i]} x #{basket_keys[i]} : price £#{basket_values[i]}"
        i += 1
      end
    puts "Total = £#{total}"
    puts "Run the method '.confirm' to complete your order."
  end

private

  def fetch_qty(key)
    qty = @basket[key] / @menu.price(key)
  end

end
