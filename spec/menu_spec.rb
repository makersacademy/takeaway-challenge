require 'menu'

describe Menu do
  it 'creates a new instance of menu' do
    expect(subject).to be_instance_of Menu
  end

  describe '#menu' do

  it 'responds to menu' do
    expect(subject).to respond_to(:menu)
  end
  end

  it 'stores a list of dishes' do
    menu = Menu.new
    menu.menu
    expect(subject.menu).to include({ 'Salmon Poke' => 8.95, 'Tuna Poke' => 8.95, 'Tofu Poke' => 8.95, 'Chicken Poke' => 8.95 })
  end
end
