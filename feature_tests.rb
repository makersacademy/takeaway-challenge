
load './lib/takeaway.rb'
cuisines = ['pizza', 'turkish', 'indian']
takeaway = Takeaway.new(cuisines[rand(0..2)])
takeaway.show_menu
rand(5..10).times { takeaway.order(rand(1..takeaway.takeaway_menu.count - 1)) }
takeaway.basket
takeaway.checkout
money = takeaway.basket.total_cost
takeaway.pay(money, FakeTextMessage.new)
