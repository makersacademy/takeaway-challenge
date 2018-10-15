class Takeaway
    
  attr_reader :menu, :order, :quantities
    
  def initialize
    @menu = {
      "noodles" => 5,
      "chow mein" => 6,
      "spring rolls" => 7,
      "sweetsour" => 8,
      "crispybeef" => 9
    }
    @order = []
    @quantities = []
  end
    
  def print_menu        
    @menu
    # @menu.each do |item, price|
    # puts "#{item} - £#{price}"
    # end
        
  end
    
  def take_order(item, quantity = 1)
    if @menu.include?(item)
      quantity.times do
        @order << item
        @quantities << quantity
      end
    else
      puts "Item not found"
    end
  end
  
  def order_total
    total = 0
    @order.each do |x|
      puts "#{x} - £#{@menu[x]}"
      total += @menu[x]
    end
    puts "Total: £#{total}"
    total
  end
    
end
