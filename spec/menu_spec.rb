require 'menu'

describe Menu do

  let(:dish1) { double :dish1 }
  let(:dish2) { double :dish2 }
  let(:dish3) { double :dish3 }

    it 'creates a menu' do
      expect(described_class).to respond_to(:new)
    end

    it 'adds a dish' do
      expect(subject.add(dish1).last).to eq dish1
    end

  describe '#view_menu' do
    let(:menu) { Menu.new }
    before do
      menu.add(dish1) ; menu.add(dish2) ; menu.add(dish3)
    end
    it 'shows a list of all dishes on the menu' do
      expect(subject.view_menu).to eq nil
    end

  end

end
