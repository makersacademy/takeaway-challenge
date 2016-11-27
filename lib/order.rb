require './lib/menu'

class Order

  attr_accessor :basket

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def view_basket
    basket.each { |line| puts "#{line[:qty]}x #{line[:item]} @ £" + "%.2f" % line[:price] }
    puts "Total = £#{calculate_total}"
  end

  def calculate_total
    12
    # basket.each.inject(0) { |sum, line| sum +


      # (@menu.check_price(line) * line[:qty])}
  end

  def add(item, quantity)
    if basket[item]
      basket[item] += quantity
    else
      basket[item]
    end
  end

end
