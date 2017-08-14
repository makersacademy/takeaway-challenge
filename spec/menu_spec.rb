require_relative '../lib/menu.rb'

describe Menu do

  it 'has one attribute' do
    menu1 = Menu.new("test")
    expect(menu1).to have_attributes(:options => "test")
  end

  it 'can create a menu' do
    menu1 = Menu.new
    expect(menu1).to respond_to(:create)
  end

  pending 'stores options in the menu'

  it 'lets the user view the menu' do
    menu1 = Menu.new
    expect(menu1).to respond_to(:view)
  end

  it 'lets the user select from the menu' do
    menu1 = Menu.new([3, 5])
    expect(menu1.select(0)).to eq(3)
  end

  pending 'checks user option'

end
