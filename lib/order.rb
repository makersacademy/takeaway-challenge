class Order
  attr_reader :order_dishes, :menu_items, :final_order


  def initialize
    @order_dishes = []
    @menu_items = {
      "pizza" => 10,
      "burger" => 6,
      "chicken wings" => 3,
      "coke" => 1,
      "coffee" => 2
    }
    @final_order = []
  end

  def select_dish(dish)
    @menu_items.each_key do |key|
    @order_dishes << dish if key == dish
    end
  end

  def final_order_compile
    #@order_dishes.each do |item|
      #@final_order << item
      @final_order = @order_dishes.uniq.map{|dish| [dish, @order_dishes.count(dish)]}.to_h
      order_total_array = []
      @order_dishes.each do |item|
        order_total_array.push(@menu_items[item])
        order_total = order_total_array.sum
        @final_order["total cost"] = order_total
        #hash[:item2] = 2
    end
  end
  end
