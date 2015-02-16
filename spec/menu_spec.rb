require 'menu'


describe Menu do

  let(:menu) { Menu.new }
  let(:dish) {double :dish, name: :pizza, price: 4}

  
  it 'has a menu' do
    expect(menu.dishes).to eq []
  end

  it 'can add food to the menu' do
    menu.add_item_to_menu(dish)
    expect(menu.dishes).to eq [dish]
  end
end