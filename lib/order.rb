class Order

  MY_MOBILE = '+447850235962'

  attr_reader :items, :total_cost

  def initialize(text_module = TextMessage)
    @items = Array.new
    @total_cost = 0
    @text_module = text_module
  end

  def add_to_basket(dish, quantity, price)
    update_items(dish, quantity)
    update_total_cost(price, quantity)
  end

  def send_confirmation(mobile_number = MY_MOBILE)
    text_module.send(mobile_number)
  end

  def view_order
    items.each do |item|
      puts item[:dish].capitalize + ' (' + item[:quantity].to_s + ')'
    end
    puts 'Total: £' + two_decimal_price(total_cost)
  end

  private

  attr_reader :text_module

  def update_total_cost(price, quantity)
    @total_cost += price * quantity
  end

  def update_items(dish, quantity)
    @items << { dish: dish, quantity: quantity }
  end

  def two_decimal_price(number)
    sprintf("%.2f", number)
  end

end
