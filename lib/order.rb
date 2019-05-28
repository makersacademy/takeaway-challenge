require './lib/dish_list.rb'
require './lib/text_message.rb'

class Order

  attr_reader :price_tracker, :dish_list

  def initialize(dish_list = DishList.new)
    @dish_list = dish_list
    @price_tracker = []
    @sms = TextMessage.new
  end

  def view_dishes
    @dish_list.menu
  end

  def food_selection(item, quantity = 1)
    quantity.times { @price_tracker << @dish_list.price(item) }
  end

  def check_total(estimate = 0)
    puts @price_tracker.sum
    @price_tracker.sum == estimate
  end

  def place_order
    @sms.send_sms
  end
end
