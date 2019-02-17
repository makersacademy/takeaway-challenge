# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order, :dishes

  def initialize
    @dishes = [
      { name: :rice, price: 3.00 }, { name: :noodles, price: 3.50 }, 
      { name: :prawn_crackers, price: 1.00 }, 
      { name: :spring_rolls, price: 2.50 }
    ]
  end

  def menu
    index = 1
    @dishes.each do |dish|
      puts "#{index}: #{dish[:name]} (£#{dish[:price]})"
      index += 1
    end
  end

  def show_order(order = @order)
    order.show_items
  end

  def add_to_order(dish_number)
    dish = @dishes[dish_number - 1]
    @order.add_dish(dish)
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order(order = @order)
    order.place
    send_sms_confirmation
  end

  def send_sms_confirmation
    sms = SMS.new
    # sms.send
    puts sms.message
  end

end
