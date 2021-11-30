require 'menu'
 
describe Menu do

  let(:menu) { described_class.new }
  let(:food) { double :food }
  let(:not_food) { double :not_food }
  let(:price) { double :price}

  it 'will check that menu contains a food and price' do
    menu.add_food(food, price)
    expect(menu.view_menu).to eq({ food => price })
  end

  it 'will check that you can order from a new menu and view it' do
    menu.add_food(food, price)
    menu.add_order(food)
    menu.order_selected
    expect(menu.order_selected).to match_array([food])
  end

  it 'will check that the total price of the bill is equivalent to the food ordered' do
    menu.add_food(food, price)
    menu.add_order(food)
    expect(menu.total_order).to match_array([price])
  end

end
