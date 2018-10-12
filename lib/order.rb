class Order
  attr_accessor :total

  def initialize(menu = Menu.new)
    @total = 0
    @menu = menu
    @items = []
  end

  def add(item)
    @total += @menu.items[item]
    @items << @menu.items.select { |food| food == item }
  end

  def order_total
    @items.each do |hash|
      hash.each do |food, price|
        puts "#{food}, £#{price}"
      end
    end
    puts "---"
    puts "Your order total is £#{@total}"
  end
end
