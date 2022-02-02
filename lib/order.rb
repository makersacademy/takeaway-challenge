class Order

  def initialize
    @ordered_dishes = {}
  end

  def add_dish(dish, quantity)
    if @ordered_dishes.key?(dish)
      @ordered_dishes[dish] += quantity
    else
      @ordered_dishes[dish] = quantity
    end
  end

  def show_order
    order = ""
    @ordered_dishes.each do |item, qty| 
      order += "Dish: #{item.name}, Qty: #{qty}\n"
    end
    order.chomp
  end

end