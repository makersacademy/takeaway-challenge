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
    expect(menu.show_dishes).to eq ("Pad thai £6.95, Green curry £8.95, Red curry £8.95, Nasi goreng £4.95, Prawn crackers £1.00, Rice £2.00")
  end



end
