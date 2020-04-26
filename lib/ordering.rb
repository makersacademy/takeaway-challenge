class Ordering
  attr_reader :ordered, :item, :quantity, :continue
  def initialize
    @ordered = {}
    @item = nil
    @quantity = nil
    @continue = "Yes"
  end

  def items
    puts "What item would you like?"
    @item = gets.chomp
  end

  def quantities
    puts "How many would you like?"
    @quantity = gets.chomp
  end

  def continuing
    puts "Would you like anything else?"
    @continue = gets.chomp
  end

  def order
    loop do
      items
      quantities
      @ordered[@item.to_sym] = @quantity.to_i
      continuing
      break if @continue == "No"
    end
  end
end
