
load './lib/takeaway.rb'
takeaway = Takeaway.new
takeaway.show_menu
rand(5..10).times { takeaway.order(rand(1..takeaway.takeaway_menu.count)) }
takeaway.basket
takeaway.checkout
money = takeaway.basket.total_cost
takeaway.pay(money,FakeTextMessage.new)
