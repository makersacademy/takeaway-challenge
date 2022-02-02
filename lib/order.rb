class Order

  def initialize
    @ordered_dishes = {}
  end

  def add_dish(dish, quantity)
    raise "Quantity ordered needs to be greater than zero" if quantity < 1
    if @ordered_dishes.key?(dish)
      @ordered_dishes[dish] += quantity
    else
      @ordered_dishes[dish] = quantity
    end
  end

  def show_order
    format_order
  end

  def total_price
    calculate_total_price
  end

  private 

  def calculate_total_price
    @ordered_dishes.inject(0) { |order_total, (dish, quantity)| order_total + (dish.price * quantity) }
  end

  def format_order
    order = ""
    @ordered_dishes.each do |ordered_dish, quantity_ordered| 
      order += format_ordered_item(ordered_dish, quantity_ordered)
    end
    order += format_price
    order.chomp
  end

  def format_ordered_item(ordered_dish, quantity_ordered)
    "Dish: #{ordered_dish.name}, Qty: #{quantity_ordered}\n"
  end

  def format_price
    "Total Price: £#{'%.2f' % total_price}"
  end
end
