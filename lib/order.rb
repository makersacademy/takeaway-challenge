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
    @basket.each { |key, _val| @qty_tracker[key] = fetch_qty(key) }
    @qty_tracker
  end

  def summary
    raise "Your basket is empty" unless !@basket.nil?
    data_org
    @basket_values.each{|price| @total += price}
    print_to_screen
  end

  private

  def fetch_qty(key)
    qty = @basket[key] / @menu.price(key)
  end

  def data_org
    @basket_keys = @basket.keys
    @qty_values = @qty_tracker.values
    @basket_values = @basket.values
    @total = 0
    @i = 0
  end

  def print_to_screen
    puts "Your order:"
      while !@basket_keys[@i].nil? do
        puts "#{@qty_values[@i]} x #{@basket_keys[@i]} : price £#{@basket_values[@i]}"
        @i += 1
      end
    puts "Total = £#{@total}"
    puts "Run the method '.confirm' to complete your order."
  end

end
