require './lib/dish_list.rb'
# require './lib/text_message.rb'

class Order

  attr_reader :price_tracker, :dish_list

  def initialize(dish_list = DishList.new)
    @dish_list = dish_list
    @price_tracker = []
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

  def place_order # @sms = TextMessage.new)
    # @sms.send_sms
    t = Time.now + 3600
    p "Your order has been placed and will be with you by #{t.strftime("%H:%M")}"
  end
end
