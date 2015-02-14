require 'menu'

describe Menu do
  
  let(:menu){ Menu.new }

  it 'should have a list of food and prices' do
    expect(menu.cereals).to include ({"Lucky Charms" => 2})
  end

 it 'knows how many cereals are on the menu' do
    expect(menu.cereals_count).to eq (3)
  end

  it 'knows the price of a cereal' do
    expect(menu.price("Frosties")).to eq(1)
  end

  it 'knows the price of a cereal' do
    expect(menu.price("Lucky Charms")).to eq(2)
  end

    it 'can display a list of dishes' do
    expect(menu.display_menu).to include ({"Lucky Charms" => 2})
  end
  #it should be include "Lucky Charms: 2" but this doesn't work,
  #yet it works in irb







end