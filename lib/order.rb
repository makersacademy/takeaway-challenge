require './lib/send_sms'

class Order
  include Message
  attr_reader :order_list, :available_dishes

  def initialize(menu_list)
    @order_list = []
    @available_dishes = menu_list
  end
  
  def add(dish, quantity = 1)
    at_index = find_dish(dish)
    item = {}
    item[@available_dishes[at_index]] = quantity
    @order_list << item
  end

  def total
    total = 0
    order_list.each do |item|
      item.each do |dish, quantity|
        total += dish.price * quantity
      end
    end
    total
  end

  def summary
    output = []
    @order_list.each do |item|
      item.each do |dish, quantity|
        output << "#{dish.name}: #{dish.price} x #{quantity} = #{dish.price * quantity}"
      end
    end
    output.join("\n")
  end

  def finish
    Message.send_confirmation
  end

  def find_dish(chosen_dish)
    availability = false
    at_index = nil
    @available_dishes.each_with_index { |dish, index| 
      if dish.name == chosen_dish 
        availability = true
        at_index = index
      end
    }
    raise 'Not on the menu.' unless availability == true
    at_index
  end
end
