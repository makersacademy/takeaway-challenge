class Order

  attr_accessor :items, :item, :number, :menu, :cost

  def initialize(items = [])
    @items = items
    @menu = Menu.new
    @cost = 0
  end

  def select_items
    puts "What menu item would you like? (Press return if you've finished ordering)"
      @item = gets.chomp
      until @item == ""
        puts "How many?"
        @number = gets.chomp.to_i
         @number.times {@items << @item}
        select_items
      end
  end

  def sum_items
    @items.each do |item|
     @cost += menu.items[item]
    end
    return cost
  end
end
