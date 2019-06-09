require 'pierogi'

describe Pierogi do
  it 'is initialized with an empty container' do
    pierogi = Pierogi.new
    expect(pierogi).to have_attributes(:menu => {} )
  end

  it 'can be added new menu' do
    pierogi = Pierogi.new
    expect(pierogi.add_menu("menu", 1)).to be_nil
  end

  it 'raises error if menu item has no price' do
    pierogi = Pierogi.new
    expect{ pierogi.add_menu("small pierogi", "large pierogi") }.to raise_error(RuntimeError, "Price must be a number")
  end
  
  it 'displays days menus' do
    pierogi = Pierogi.new
    pierogi.add_menu("pierogi", 3)
    expect(pierogi.show_food).to eq({"pierogi" => 3})
  end
end