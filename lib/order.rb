require_relative "./dish"
require_relative "./sms"

class Order 

  attr_reader :order_list

  def initialize(dish_class = Dish, sms_class = SMS)
    @sms_class = sms_class
    @dish_class = dish_class
    @order_list = []
    @total = 0
  end

  def read_dish(dish)
    @dish_name = dish.read_name
    @dish_price = dish.read_price
  end

  def add_dish_to_order(quantity)
    @ordered_dish = @dish_class.new(@dish_name, 
      @dish_price)
    @ordered_dish.amount(quantity)
    update_total
    @order_list << @ordered_dish
  end

  def verify_total
    sum = 0
    @order_list.each { |dish| sum += dish.dish_total }
    return true if @total == sum
    return false
  end

  def display_total
    @total.dup
  end

  def display
    @order_list.dup
  end

  def checkout(text_sender = @sms_class)
    text_sender.instance.send_message
  end
  
  private 

  def update_total
    @total += @ordered_dish.dish_total
  end

end
