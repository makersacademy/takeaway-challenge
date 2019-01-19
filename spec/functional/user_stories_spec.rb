# nouns: list, dishes, prices, meal, total, text

# list = object Menu
# dish = subset of Menu
# meal = chosen items
# total =  total price
# takeaway = main program
# text = text object - pass hash, not arguments

require 'Takeaway'

RSpec.describe 'Functional tests' do
let(:pieshop) { Takeaway.new }
let(:menu) { Menu.new('menu.csv')}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows list of dishes with prices' do
    expect(menu.list).to eq "Item\t\tPrice\nVegetable pie\t\t2\nLamb pie\t\t3\nSteak pie\t\t3\nKangaroo pie\t\t4\nDog Pie\t\t1\nMonkey Pie\t\t5\nWhale Pie\t\t6\n"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows an order of multiple dishes to be placed' do
    pieshop.order('Vegetable pie', 2)
    pieshop.order('Steak pie', 3)
    pieshop.order('Monkey pie')
    expect(pieshop.show_order).to eq [{"Vegetable pie"=>2}, {"Steak pie"=>3}, {"Monkey pie"=>1}]
  end

end
