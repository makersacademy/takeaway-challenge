class Order

  MENU = {
    'curry goat': 9.00,
    'brown stew chicken': 8.00,
    'jerk chicken': 8.00,
    'steamed fish': 7.00,
    'vegetable curry': 6.00,
    'rice and peas': 4.50,
    'plain rice': 4.50,
    'roti': 5.00,
    'salad': 4.00,
    'fried dumpling': 1.50,
    'coleslaw': 1.00,
    'beef patty': 2.50,
    'lamb patty': 2.50,
    'chicken patty': 2.50,
    'saltfish patty': 2.50,
    'veg patty': 2.50
  }

  def initialize
    @basket = Hash.new(0)
  end

  def see_menu
    MENU
  end

  def add(item, qty)
    raise 'Please choose valid menu option' if not_on_menu?(item)
    raise 'Quantity must be a valid integer' if not_a_number?(qty)

    @basket[item.to_sym] += qty.to_i
  end

  def basket
    @basket.dup
  end

  def review
    puts "Your order"

    @basket.each do |item, qty|
      subtotal = MENU[item] * qty
      puts "x#{qty} #{item}, #{price_format(subtotal)}"
    end

    puts "Total: #{price_format(order_total)}"
  end

  private

  def not_on_menu?(item)
    MENU[item.to_sym] == nil
  end

  def not_a_number?(qty)
    qty.class != Integer || qty.negative?
  end

  def price_format(num)
    "£#{sprintf('%.2f', num)}"
  end

  def order_total
    @basket.reduce(0) { |sum, (item, qty)| sum + MENU[item] * qty }
  end
end