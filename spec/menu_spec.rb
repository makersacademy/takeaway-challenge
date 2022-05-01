require 'menu'

describe Menu do

  subject(:menu) { Menu.new("pizza_menu.csv") }

  it 'creates new instances of Menu class' do
    expect(menu).to be_an_instance_of(Menu)
  end

  describe '# read_menu' do
    it 'reads the menu without raising error' do
      expect { menu.read_menu }.not_to raise_error
    end
  end

  describe '# csv_to_hash' do
    it 'converts a csv file into a hash' do
      expect(menu.csv_to_hash).to be_an_instance_of(Hash)
    end
  end

end
