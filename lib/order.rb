class Order

  OUTPUT_WIDTH = 60

  attr_reader :total_bill

  def initialize(order_information = Hash.new, menu = Menu.new)
    @order_information = order_information
    @menu = menu
    @total_bill = initialize_total
  end

  def total
    @total_bill = items_total.inject(:+)
  end

  def print_order(output_width = OUTPUT_WIDTH)
    print_header(output_width)
    print_body(output_width)
    print_total(output_width)
  end

  def add_hash_to_order(order_info)
    order_info.each do |key,quantity|
      @order_information.store(key,quantity)
    end
  end

  def finalize_order
    asserts_order_info!
    communicates_completion
    total
  end

  private

  def initialize_total
    @order_information.length == 0 ? "n/a" : total
  end

  def communicates_completion
    send_sms
    puts "You have placed your order, total: $#{total}."
  end

  def asserts_order_info!
    raise "Can't place order without information about the order: please provide what you would like to order in acceptable format." if @order_information.length == 0
  end

  def send_sms
    SMS.new(total).send_sms
  end

  def items_total
    menu_hash = @menu.dishes
    @order_information.map do |key,quantity|
      menu_hash[key].price * quantity
    end
  end

  def print_header(output_width)
    puts "Details of your order:".center(output_width),
    "-----------------".center(output_width),
    ""
  end

  def print_body(output_width)
    menu_hash = @menu.dishes
    @order_information.each do |key,quantity|
      name = menu_hash[key].name
      price = menu_hash[key].price
      puts "#{name}, $#{price} x #{quantity} = $#{price*quantity}".center(output_width),
      ""
    end
  end

  def print_total(output_width)
    puts "Total: $#{total}".center(output_width),
    "Thank you for your order!".center(output_width),
    ""
  end

end
