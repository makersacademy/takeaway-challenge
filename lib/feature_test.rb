require './lib/order.rb'
menu = Menu.new([{ name: 'Spaghetti', price: 10 }, { name: 'Bolognese', price: 12 }, { name: 'Pizza', price: 8 }])
order = Order.new(menu)
order.add_entry("Spaghetti", 4)
order.add_entry("Pizza", 2)
order.add_entry("Lasagna", 4)
order.total_amount
order.place(56, "Mary", "+447756241735")
