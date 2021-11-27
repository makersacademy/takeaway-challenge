require_relative "./dish"

class Menu

  def initialize(dish_class = Dish)
    @menulist = []
    @order = []
    @dish_class = dish_class
    @total = 0
  end

  def display
    @menulist.dup
  end

  def choose(dish, quantity)
    raise "Dish not in menu" unless @menulist.include?(dish)
    read_dish(dish)
    add_dish_to_order(quantity)     
  end

  def verify_order_total
    sum_of_dishes = 0
    @order.each { |x| sum_of_dishes += x.dish_total }
    return true if sum_of_dishes == @total
    return false
  end

  def add_dish_to_menulist(dish)
    # raise "Not a valid dish" unless dish.is_a? @dish_class
    @menulist << dish
  end

  def total
    @total.dup
  end

  def order
    @order.dup
  end

  private

  def read_dish(dish)
    @last_selected_dish_name = dish.read_name
    @last_selected_dish_price = dish.read_price
  end

  def add_dish_to_order(quantity)
    @last_selected_ordered_dish = @dish_class.new(@last_selected_dish_name, 
      @last_selected_dish_price)
    @last_selected_ordered_dish.amount(quantity)
    update_total
    @order << @last_selected_ordered_dish
  end

  def update_total
    @total += @last_selected_ordered_dish.dish_total
  end

end
