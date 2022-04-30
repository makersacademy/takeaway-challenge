require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'creates an instance of the class' do
    expect(menu).to be_instance_of(Menu)
  end

  it 'initializes with a dishes array' do
    expect(menu.dishes).not_to be_empty
  end

  it 'initializes wiht a dishes array that contains dishes' do
    expect(menu.dishes).to include({id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true})
  end

  it 'contains multiple dishes' do
    expect(menu.dishes).to include({id: 11, name: 'Phad Thai', price: 11, available?: true})
  end

  it 'displays all of the dishes' do
    expect(menu.display_dishes[1]).to eq("2. Veggie Breakfast - £8 - available")
  end

  it 'selects a dish' do
    expect(menu.select_dish(1)).to eq({id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true})
  end

  it 'returns a price of a dish' do
    expect(menu.dish_price(1)).to eq 7
  end

  it 'informs whether the dish is available' do
    expect(menu.dish_available?(1)).to eq true
  end

end