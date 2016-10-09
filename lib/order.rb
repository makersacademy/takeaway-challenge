require_relative 'basket'

class Order

  def initialize
    @basket = Basket.new
  end

  def add_dish(item,quantity)
    basket = @basket.items
    quantity.times { basket.push(item) }
    add_dish_success_message(item,quantity)
  end

  def view_basket
    fail 'Basket empty' if @basket.items == []
    @basket.summary
  end

  def calculate_total
    total = 0
    @basket.items.each { |item| item.each { |k,v| total += v.to_f } }
    @total = total.to_f
  end

  def view_cost(cost = calculate_total)
    fail 'Total cost £0: basket empty' if cost == 0
    "Total cost: £#{cost.to_f}"
  end

  def full_order
    #fail 'ERROR' if calculate_total !=
    puts view_basket
    puts view_cost
  end

  def finalize_order_message(time = Time.new)
    "Thank you! Your order has been placed, and will be delivered before #{(time + 3600).strftime("%I:%M%p")}"
  end

  def add_dish_success_message(item,quantity)
    "#{quantity}x #{item.keys[0]}(s) added to your basket"
  end

end
