class Order
  attr_accessor :basket

  def initialize
    @basket = {}
  end

  def show_basket
    @basket.each do |item, quantity|
      puts item.format_item + " x #{quantity}"
    end
  end

  def calculate_total_price
    total = 0
    @basket.each do |item, quantity|
      total += item.price * quantity
    end
    puts "Total: £#{'%.2f' % total}"
  end

  def calculate_subtotals
    @basket.each do |item, quantity|
      puts "#{item.name} x #{quantity}: £#{'%.2f' % (item.price * quantity)}"
    end
  end

end
