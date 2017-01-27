require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe 'class creation' do
    it 'creates an instance of a class' do
      expect(menu).to be_a(Menu)
    end
  end

  describe '#load_menu' do
    it 'loads a menu from the file to dishes' do
      expect(menu.dishes).to be_a(Hash)
    end
    context 'when the file doesn\'t exist' do
      it 'raises error' do
        message = "Cannot open file: there is no file with this name. Please try another filename."
        expect {menu.load_menu('wrong_name.csv')}.to raise_error(message)
      end
    end
  end

  describe '#print_menu' do
    it 'loads a menu from the file to dishes' do
      expect(menu.dishes).to be_a(Hash)
    end
    it 'prints menu to stout' do
      expect { menu.print_menu }.to output.to_stdout
    end
  end

end
