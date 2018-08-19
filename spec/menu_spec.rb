require 'menu'

describe Menu do

  let(:dish1) { double :dish1, name: 'dish1', price: 1 }
  let(:dish2) { double :dish2, name: 'dish2', price: 2 }
  let(:dish3) { double :dish3, name: 'dish3', price: 3 }

  it 'creates a menu' do
    expect(described_class).to respond_to(:new)
  end

  describe '#view_menu' do
    let(:menu) { Menu.new }
    before { menu.add(dish1); menu.add(dish2); menu.add(dish3) }

    it 'shows a list of all dishes on the menu' do
      expect(menu.view_menu).to eq ["dish1 - 1", "dish2 - 2", "dish3 - 3"]
    end

  end

end
