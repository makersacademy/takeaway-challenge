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
    puts "Total: £#{'%.2f' % calculate_total}"
  end

  def calculate_total
    @basket.map do |item, quantity|
      item.price * quantity
    end.sum
  end

  def calculate_subtotals
    @basket.each do |item, quantity|
      puts "#{item.name} x #{quantity}: £#{'%.2f' % (item.price * quantity)}"
    end
  end

  def wipe
    @basket = {}
  end

end
