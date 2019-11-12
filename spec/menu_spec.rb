require 'menu'

describe Menu do
  it 'creates an instance of Menu' do
    menu = Menu.new
    expect(menu).to be_instance_of(Menu)
  end

  it 'shows a list of all dishes with prices' do
    menu = Menu.new
    expect(menu).to respond_to(:list)
  end
end
