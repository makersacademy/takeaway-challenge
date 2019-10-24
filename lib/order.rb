class Order
  attr_reader :menu, :selected_dishes, :item_prices

  def initialize(menu)
    @menu = menu
    @food_items = menu.food_items
    @selected_dishes = []
    @item_prices = []
  end

  def select_dish(item)
    @food_items.each do |food, price|
      @selected_dishes << food if food == item
    end
  end

  def view_selected_dishes
    puts selected_dishes
  end

  def log_dishes_cost
    @selected_dishes.each do |item|
      @item_prices <<  @food_items[item]
    end
  end

  def total_order_cost
    print "£#{@item_prices.sum}"
  end

  def place_order
    @selected_dishes.each do |item|
      puts "#{item} x 1"
    end
  end
end
