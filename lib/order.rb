class Order
  attr_accessor :items, :total
  attr_reader :total

  def initialize
    @items = []
  end

  def select_item(item, quantity)
    @items << [item,quantity]
    puts "Current total: #{total}"
  end

  def total
    total = 0
    @items.each do |pizza|
      total += pizza[0][:price]*pizza[1]
    end
    total.round(2)
  end

  def print_items
    items.map{|x| "#{x[0][:name]}. Quantity: #{x[1]}"}
  end

end
