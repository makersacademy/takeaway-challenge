class Order
  LINEWIDTH = 50
  attr_reader :items, :total

  def initialize(total = 0)
    @items = []
    @total = total
  end

  def add(dish, price, quantity)
    item = {}
    item[:dish] = dish.capitalize
    item[:price] = price
    item[:quantity] = quantity
    items << item
  end

  def totals
    items.each { |x| @total += x[:price].to_f*x[:quantity] }
    total
  end

  def display
    puts "-"*(LINEWIDTH-9)
    puts "ORDER", "", "Item".ljust(LINEWIDTH/2) +
      "Price".ljust((LINEWIDTH-34)/2) + "Quantity".ljust(LINEWIDTH)
    puts "----".ljust(LINEWIDTH/2) + "-----".ljust((LINEWIDTH-34)/2) +
      "--------".ljust(LINEWIDTH) + "\n"
    items.each do |x|
      puts x[:dish].capitalize.ljust(LINEWIDTH/2) +
        ("£"+x[:price]).ljust((LINEWIDTH-34)/2) +
        ("x#{x[:quantity]}").ljust(LINEWIDTH)
    end
    puts "-"*(LINEWIDTH-9)
  end

end
