class Takeaway
  attr_reader :ordered, :item, :quantity, :continue

  def initialize
    @ordered = {}
    @item = nil
    @quantity = nil
    @continue = "Yes"
  end

  def view_menu
    { Burger: 4, Fish: 4, Sausage: 4, Chips: 1 }
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

  def check_order
    total = view_menu.map { |k, v| v * ordered[k] if ordered.key? k }.compact.sum
    puts "Please enter total cost:"
    amount = gets.chomp
    fail "Please recheck" if amount.to_i != total
  end
end
