class Order

  OUTPUT_WIDTH = 60

  attr_reader :total

  def initialize(order_hash, menu_hash)
    @order_hash = order_hash
    @menu_hash = menu_hash
    @order_hash.is_a?(Hash) ? @total = total : @total = "n/a"
  end

  def total
    items_total.inject(:+)
  end

  def print_order(output_width = OUTPUT_WIDTH)
    print_header(output_width)
    print_body(output_width)
    print_total(output_width)
  end

  private

  def items_total
    @order_hash.map do |key,value|
      @menu_hash[key].price * value
    end
  end

  def print_header(output_width)
    puts "Details of your order:".center(output_width),
    "-----------------".center(output_width),
    ""
  end

  def print_body(output_width)
    @order_hash.each do |key,value|
      name = @menu_hash[key].name
      price = @menu_hash[key].price
      puts "#{name}, $#{price} x #{value} = $#{price*value}".center(output_width),
      ""
    end
  end

  def print_total(output_width)
    puts "Total: $#{total}".center(output_width),
    "Thank you for your order!".center(output_width),
    ""
  end

end
