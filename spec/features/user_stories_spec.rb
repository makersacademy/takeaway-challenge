require 'menu'

describe 'User Stories' do
  let(:menu) { Menu.new }
  let(:curry) { Dish.new('Curry', 5) }
  let(:rice) { Dish.new('Rice', 2) }
  let(:naan_bread) { Dish.new('Naan bread', 2) }
  let(:basket) { Basket.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'prints the menu with prices' do
    menu.add(curry)
    menu.add(rice)
    expect { menu.display }.to output("Menu List:\nCurry - £5\nRice - £2\n").to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'selects a number of dishes and adds them to a basket' do
    menu.add(curry)
    menu.add(rice)
    menu.add(naan_bread)
    basket.add(curry)
    basket.add(rice)
    basket.add(rice)
    expect { basket.show }.to output("Basket:\nCurry - £5 x 1\nRice - £2 x 2\nSub-total: £9").to_stdout
  end
end
