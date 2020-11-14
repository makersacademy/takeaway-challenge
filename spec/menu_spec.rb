require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    menu = Menu.new
    expect(menu).to be_instance_of(Menu)
  end

  it 'responds to list' do
    menu = Menu.new
    expect(menu).to respond_to(:list)
  end

  it 'shows menu list of dishes with prices' do
    menu = Menu.new
    menu.list
    expect(:meal => "Fish", :price => 2.00).to include(:meal => "Fish", :price => 2.00)
  end
end
