class Order
  attr_reader :items
  
  def initialize(menu:, messenger:)
    @menu = menu
    @items = []
    @messenger = messenger
  end

  def add_dish(dish_no:, qty:)
    dish = @menu.select(dish_no: dish_no)

    @items << { dish: dish, qty: qty }

    formatted_total
  end

  def formatted_total
    format_with_currency(calculate_total)
  end

  def calculate_total
    total = 0
    @items.each do |item|
      total += item[:dish].price * item[:qty]
    end
    total
  end

  def format_with_currency(total)
    "£#{'%.2f' % total}"
  end

  def checkout(expected_total:, mobile_number:)
    check_matches_order_total(expected_total)

    @messenger.send_message(
      message: order_confirmation_message,
      mobile_number: mobile_number
    )
  end

  def order_confirmation_message
    "Thank you! Your order was placed and will " + 
    "be delivered before #{delivery_time}"
  end

  def delivery_time
    time = Time.now
    (time + 60 * 60).strftime("%H:%M")
  end

  def check_matches_order_total(expected_total)
    error_message = 'Your expected total does not match order total'
    raise error_message if expected_total != calculate_total
  end

  private(
    :formatted_total, 
    :format_with_currency, 
    :formatted_total, 
    :delivery_time, 
    :check_matches_order_total, 
    :order_confirmation_message
  )
end
