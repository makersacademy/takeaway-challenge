require 'spec_helper'

feature 'List menu dishes' do
  scenario 'menu has dishes' do
    menu_list = "Pasta, 5\nBolognese, 5\nSalad, 2\n"
    pasta = Dish.new('Pasta', 5)
    bolognese = Dish.new('Bolognese', 5)
    salad = Dish.new('Salad', 2)
    menu = Menu.new([pasta, bolognese, salad])
    expect { menu.list }.to output(menu_list).to_stdout
  end
end
