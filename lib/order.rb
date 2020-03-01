require_relative 'menu'
require_relative 'sms'

class Order
# Edge cases not dealt with yet:
  # .add: negative quanity should raise an error
  # .remove: maximum number of items to remove is quantity in basket

# Improvements:
  # make it possible for items to be removed from order (.remove)
  # make .add method more succinct

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

    @total += price * quantity
    update_order dish, price, quantity
    # work out if this dish is already part of the order
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
    added = false
    @order.map do |item|
      if item[:dish] == dish
        item[:quantity] += quantity
        item[:amount] = price * item[:quantity]
        added = true
      end
    end
    @order.push({ dish: dish, quantity: quantity, amount: price * quantity }) unless added
  end

end
