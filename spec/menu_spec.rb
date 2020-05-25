require 'menu'

describe Menu do
  let(:menu) { Menu.new }

  it 'should respond to view' do
    expect(menu).to respond_to(:view_menu)
  end

  it 'should print the menu' do
    expect(menu.view_menu).to eq({ "Apple" => 1, "Banana" => 2, "Mango" => 3, "Peach" => 4, "Pear" => 5 })
  end

  it 'should respond to select' do
    expect(menu).to respond_to(:select).with(2).arguments
  end

  it 'should respond to basket_total' do
    expect(menu).to respond_to(:basket_total)
  end
end
