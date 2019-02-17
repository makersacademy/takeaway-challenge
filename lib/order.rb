class Order
  attr_reader :items
  
  def initialize(menu)
    @menu = menu
    @items = []
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

  def checkout(expected_total)
    check_matches_order_total(expected_total)

  end

  def check_matches_order_total(expected_total)
    error_message = 'Your expected total does not match order total'
    raise error_message if expected_total != calculate_total
  end

  private :formatted_total, :format_with_currency, :formatted_total
end