# contains a list of items and quantity
class Order
  attr_reader :basket

  def initialize(basket = Basket)
    @basket = basket.new
  end

  def add_to_basket(menu)
    @basket.add(menu)
  end

  def place
  end

  def view
    total = 0
    order_header
    @basket.contents.each { |item|
      puts "#{item[:qty]} x #{item[:name]} @ £#{'%.2f' % (item[:unit_cost] / 100.00)} - £#{'%.2f' % (item[:price] / 100.00)}"
      total += item[:price]
    }
    order_summary
    puts "£#{'%.2f' % (total / 100.00)}"
  end

  private

  def order_header
    puts "ORDER SUMMARY"
    puts "-------------"
  end
  
  def order_summary
    puts "-------------"
    print "TOTAL: "
  end

end
