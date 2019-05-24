require 'menu'

describe Menu do

  let(:menu)        { Menu.new(dish_class) }
  let(:dish_class)  { double(:dish_class, new: dish) }
  let(:dish)        { double(:dish, name: 'Margherita') }

  it 'can return a full list of menu items' do
    expect(menu.items).to include(dish)
  end

  it 'can return 1 item and price dependant on name of item' do
    expect(menu.get_dish('Margherita')).to include(dish)
  end
  
end
