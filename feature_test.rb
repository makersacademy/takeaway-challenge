require './lib/restaurant'

restaurant = Restaurant.new({ taco: 5, pasta: 10, pizza: 15, burger: 3, golden_taco: 999 })
order = Order.new(ENV['MY_PHONE_NUMBER'])
order.add(:taco, :pasta, :pasta)
order.remove(:pasta)
total = restaurant.order_total(order)
delivery_time = restaurant.delivery_time
verify_total = order.items.map { |item| restaurant.menu[item] }.sum

restaurant.place_order(order)
