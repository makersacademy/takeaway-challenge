require 'menu'

describe 'Menu' do

  it 'creates a new instance of the Menu class' do
    expect(Menu.new).to be_instance_of Menu
  end

  it 'has a method that shows dishes' do
    expect(Menu.new).to respond_to(:show_dishes)
  end

  it 'the show dishes method shows the list of dishes available' do
    menu = Menu.new
    expect(menu.show_dishes).to eq menu.dishes
  end

  it "selects a dish on the menu" do
    menu = Menu.new
    expect(menu.select('pad thai')).to eq(['pad thai', 6.95])
  end



end
