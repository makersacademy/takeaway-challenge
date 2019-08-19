require_relative '../../lib/takeaway.rb'

foo_menu = Menu.new([Dish.new('Foo soup', 2), Dish.new('Bar broth', 5)])

app = Takeaway.new(foo_menu)

app.show_menu

app.add_to_basket('Bar broth', 2)
app.add_to_basket('Foo soup', 3)

app.view_basket

app.subtotal

app.checkout(16)
