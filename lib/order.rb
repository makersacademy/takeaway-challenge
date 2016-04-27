class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @itemised_basket = []
    @basket = []
  end

  def select(dish, qty = 1)
    qty.times { @itemised_basket << @menu.pick(dish) }
    @basket = @itemised_basket.inject{|dish, price| dish.merge(price){|dish, price_one, price_two| price_one + price_two}}
    puts "#{qty} x #{@itemised_basket[-1]}"
  end

  def basket
    @basket
  end

  def summary
    raise "Your basket is empty" unless !@basket.nil?
    qty_tracker
    data_org
    @prices.each{|price| @total += price}
    print_to_screen
  end

  private

  def fetch_qty(dish)
    qty = @basket[dish] / @menu.price(dish)
  end

  def qty_tracker
    @qty_tracker = {}
    @basket.each { |key, val| @qty_tracker[key] = fetch_qty(key) } #use .each{key}
    @qty_tracker
  end

  def data_org
    @dishes = @basket.keys
    @qtys = @qty_tracker.values
    @prices = @basket.values
    @total = 0
    @i = 0
  end

  def print_to_screen
    puts "Your order:"
      while !@dishes[@i].nil? do
        puts "#{@qtys[@i]} x #{@dishes[@i]} : price £#{@prices[@i]}"
        @i += 1
      end
    puts "Total = £#{@total}"
    puts "Run the method '.confirm' to complete your order."
  end

end
