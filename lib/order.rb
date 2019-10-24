class Order
  attr_accessor :menu, :selected_dishes, :item_prices, :unique_selected_dishes

  def initialize(menu)
    @menu = menu
    @food_items = menu.food_items
    @selected_dishes = []
    @item_prices = []
    @unique_selected_dishes = []
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
      @unique_selected_dishes << item if @unique_selected_dishes.include?(item) == false
    end
    @unique_selected_dishes.each do |item|
      puts "#{item} x #{@selected_dishes.count(item)}"
    end
  end
end
