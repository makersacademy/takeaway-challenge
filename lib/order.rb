class Order
  def initialize(items = [])
    @items = items
  end

  def add_item(item, quantity)
    quantity.times { @items.push(item) }
  end

  def total
    @items.map { |i| i.item_price }.sum
  end

  def empty?
    @items.empty?
  end

  def to_s
    if empty?
      puts "Your basket is empty"
      return
    end

    @items.uniq.each do |item|
      puts item
      puts "Quantity: #{quantity(item)}"
    end
    puts "Total: £#{total}"
  end

  private

  def quantity(item)
    @items.count(item)
  end
end
