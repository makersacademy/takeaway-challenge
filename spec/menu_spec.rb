require 'menu'

describe Menu do
  before(:each) do
    @menu = Menu.new
  end

  it 'should default to empty menu' do
    expect(@menu.dishes).to be_empty
  end

  it 'should show if menu is empty' do
    expect(@menu.to_s).to eq("Menu is empty")
  end

  it 'should add item to menu' do
    name = "pie"
    price = 3.14
    @menu.add_item(name, price)
    expect(@menu.dishes).to include({ name => price })
  end

  it 'should get correct price' do
    name = "test"
    price = rand(1000) / 100.0
    @menu.add_item(name, price)
    expect(@menu.price(name)).to eq(price)
  end
end
