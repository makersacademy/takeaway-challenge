require_relative 'menu'
require_relative 'sms'

class Order
# Edge cases not dealt with yet:
  # .add: negative quanity should raise an error
  # .remove: maximum number of items to remove is quantity in basket

# Improvements:
  # make it possible for items to be removed from order (.remove)
  # create an .update_total (private) that recalculates @total using @order

  def initialize(menu = Menu.new)
    @order = []
    @total = 0
    @menu = menu
  end

  def display
    raise "No items in basket. Please select dishes" if @order.length.zero?

    puts "\n" + left("Dish") + "Quantity".center(10) + "Amount".center(10)
    @order.each do |item|
      puts left("#{item[:dish]}") + "#{item[:quantity]}".center(10) + "#{currency item[:amount]}".center(10)
    end
    puts "\nTotal order: #{currency @total}"
  end

  def add(dish_num, quantity)
    price = @menu.menu[dish_num - 1][:price]
    dish = @menu.menu[dish_num - 1][:dish]

    @total += price * quantity # might be better to create a method that calculates @total
    update_order dish, price, quantity
    # work out if this dish is already part of the order
  end

  def remove(dish_num, quantity)
    # find price and dish
    # update @total to remove this amount from total
    # call update_order
    # if a method that calculates @total is created, call it here rather than step above
  end

  def confirmed(phone_number)
    delivery_time = (Time.new + (60 * 60)).strftime('%k:%M')
    message = "Thankyou! Your order was placed and will be delivered before #{delivery_time}"
    SMS.new phone_number, message
    puts "Message was sent"
  end

  private
  def currency money
    '£%.2f' % money
  end

  def left string
    '%-10s' % string
  end

  def update_order dish, price, quantity
    # add checks here for whether quantity is < 1. If it is, delete from @order
    added = false
    @order.map do |item|
      if item[:dish] == dish
        item[:quantity] += quantity
        item[:amount] = price * item[:quantity]
        added = true
      end
    end
    @order.push({ dish: dish, quantity: quantity, amount: price * quantity }) unless added
    @order.select! { |item| item[:quantity] > 0}
  end

end
