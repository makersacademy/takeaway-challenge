require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  context 'class creation' do
    it 'creates an instance of a class' do
      expect(menu).to be_a(Menu)
    end
  end

  context 'load_menu' do
    it 'raises error if the file doesn\'t exist' do
      message = "Cannot open file: there is no file with this name. Please try another filename."
      expect {menu.load_menu('wrong_name.csv')}.to raise_error(message)
    end
    it 'loads a menu from the file to dishes' do
      expect(menu.dishes).to be_a(Hash)
    end
  end

end
