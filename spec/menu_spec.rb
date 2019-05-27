require 'menu'

describe Menu do
  let(:menu)        { Menu.new }
  let(:food_item)   { double(:food_item, name: "Pizza", price: 15.00) }
  let(:food_item_1) { double(:food_item_1) }

  it 'should add food items to a menu' do
    3.times { menu.add(food_item) }
    expect(menu.menu).to eq([food_item, food_item, food_item])
  end

  it 'should remove a food item' do
    2.times { menu.add(food_item) }
    menu.add(food_item_1)
    menu.add(food_item)
    expect(menu.remove(food_item_1)).to eq([food_item, food_item, food_item])
  end

  it 'should display the name and price of a food item' do
    menu.add(food_item)
    expect { menu.display_menu }.to output("Pizza: £15.00\n").to_stdout
  end
end
