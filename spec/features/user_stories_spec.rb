require 'menu'

describe 'User Stories' do
  let(:menu) { Menu.new }
  let(:basket) { Basket.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'prints the menu with prices' do
    expect { menu.display }.to output("Menu List:\n1. Curry - £5\n2. Rice - £2\n3. Naan bread - £2\n").to_stdout
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'selects a number of dishes and adds them to a basket' do
    basket.add(1)
    basket.add(2)
    basket.add(2)
    expect(basket.contents).to eq([{ number: 1, name: 'Curry', price: 5, quantity: 1 }, { number: 2, name: 'Rice', price: 2, quantity: 2 }])
  end
end
