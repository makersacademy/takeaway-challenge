require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  it 'should be created with a core menu of items' do
    expect(menu.menu_items).to contain_exactly([:Beer, 2.5], [:"Chicken Nuggets", 3])
  end

  it 'can add items with a price to the menu' do
    menu.menu_items_set(Fish: 2.8)
    expect(menu.menu_items).to include(:Fish => 2.8)
  end

  it "can return the price of 1 beer" do
    expect(menu.menu_items[:Beer]).to eq 2.5
  end


end