require_relative '../../lib/user_interface.rb'

app = UserInterface.new

menu = Menu.new([Dish.new('Foo soup', 2), Dish.new('Bar broth', 5)])

app.show_menu(menu)

app.add_to_basket(menu, 'Bar broth', 2)
app.add_to_basket(menu, 'Foo soup', 3)

app.show_basket

app.checkout(15)
