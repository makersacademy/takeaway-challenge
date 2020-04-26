class Takeaway
  attr_reader :order, :item, :quantity, :continue

  def initialize
    @order = []
    @item = nil
    @quantity = nil
    @continue = "Yes"
  end

  def view_menu
    { Burger: 4, Fish: 4, Sausage: 4, Chips: 1 }
  end

  def item
    puts "What item would you like?"
    @item = gets.chomp
    #@order << "#{quantity} x #{item}"
  end

  def quantity
    puts "How many would you like?"
    @quantity = gets.chomp
  end

  def continue
    puts "Would you like anything else?"
    @continue = gets.chomp
  end

  #def order
  #  while true do
  #    item
  #    quantity
  #    @order << "#{item} x #{quantity}"
  #  end
  #end
end
