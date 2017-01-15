class Order

  OUTPUT_WIDTH = 60

  attr_reader :total

  def initialize(order_hash, menu_hash)
    @order_hash = order_hash
    @menu = menu_hash
    @order_hash.is_a?(Hash) ? @total = total : @total = "n/a"
  end

  def total
    total = 0
    @order_hash.each do |key,value|
      total += @menu[key].price * value
    end
    total
  end

  def print_order(output_width = OUTPUT_WIDTH)
    print_header(output_width)
    print_body(output_width)
    print_total(output_width)
  end

  private

  def print_header(output_width)
    puts "Details of your order:".center(output_width),
    "-----------------".center(output_width),
    ""
  end

  def print_body(output_width)
    @order_hash.each do |key,value|
      name = @menu[key].name
      price = @menu[key].price
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
