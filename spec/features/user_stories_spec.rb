require 'menu'
require 'order'

describe 'User Stories' do
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:dish) { :dish }
  let(:price) { :price }
  let(:quantity) { :quantity }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'The customer can ask menu to list its dishes' do
    allow(menu).to receive(:list_dishes).and_return([{ dish => price }])
    expect(menu.list_dishes).to eq([{ dish => price }])
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'A customer can select some number of several dishes' do
    expect(order.select_dish(dish, quantity)).to eq({ dish => quantity })
  end
end
