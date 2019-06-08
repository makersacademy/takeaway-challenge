require 'pierogi'

describe Pierogi do
  it 'is initialized with an empty container' do
    pierogi = Pierogi.new
    expect(pierogi).to have_attributes(:food => [] )
  end

  it 'can be added new menu' do
    menu = double("menu")
    pierogi = Pierogi.new
    expect(pierogi.todays_menu(menu)).to be_nil
  end
  
  it 'displays days menus' do
    menu = double("menu")
    pierogi = Pierogi.new
    pierogi.todays_menu(menu)
    expect(pierogi.show_food).to eq menu
  end
end