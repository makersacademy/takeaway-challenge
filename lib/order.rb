class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(menu, dish_number, quantity)
    quantity.times do
      @basket << menu.select(dish_number)
    end
  end

  def summary
    basket_hash = {}
    basket.uniq.each do |a|
      basket_hash[a] = basket.count(a)
    end
    basket_hash.each_pair do |k, v|
      puts "#{v}x #{k.name} | £#{'%.2f' % (v * k.price)}"
    end
    puts "Total cost: £#{'%.2f' % basket.inject(0){|sum, x| sum + x.price}}"
  end

  def submit(payment)
    fail "Payment does not match total cost" if basket.inject(0){|sum, x| sum + x.price} != payment
    send_text
  end

end