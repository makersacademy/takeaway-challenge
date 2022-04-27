require_relative 'dishes'
require_relative 'order'
require_relative 'twilio_provider'

class Takeaway
  attr_reader :dishes_list, :new_order

  def initialize(dishes_list = Dishes.new)
    @dishes_list = dishes_list
    @new_order = []
  end

  def print_available_dishes
    @dishes_list.dishes.each do |dish|
      puts "#{dish[:id]}.#{dish[:name]}: £#{dish[:price]}" if dish[:available] > 1
    end
  end

  def select_dish(dish_id, amount)
    @dishes_list.available?(dish_id, amount)
    amount.times do
      add_dish_to_order(dish_id)
    end
  end

  def add_dish_to_order(dish_id)
    @dishes_list.dishes.each do |dish|
      if dish[:id] == dish_id
        @new_order << { dish[:name] => dish[:price] }
        dish[:available] = dish[:available] - 1
      end
    end
  end

  def send_confirmation_text
    twilio = TwilioProvider.new
    twilio.send_text
  end
end
