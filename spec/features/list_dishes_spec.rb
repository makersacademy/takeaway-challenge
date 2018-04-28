require 'spec_helper'

feature 'list menu dishes' do
  scenario 'menu has no dishes' do
    menu = Menu.new
    ottolenghi_menu = Menu.new
    menu.list
  end

  xscenario 'menu has dishes' do
    pasta = Dish.new('Pasta', 5)
    bolognese = Dish.new('Bolognese', 5)
    salad = Dish.new('Salad', 2)
    menu = Menu.new(dishes: [pasta, bolognese, salad])
    ottolenghi_menu = Menu.new
    menu.list
  end
end

=begin

Place the order by giving the list of dishes, their
quantities and a number that should be the exact total.
If the sum is not correct the method should raise an error,
otherwise the customer is sent a text saying that the order
was placed successfully and that it will be delivered 1 hour
from now, e.g. "Thank you! Your order was placed and will be
delivered before 18:52".

=end
