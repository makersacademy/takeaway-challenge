require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'initializes with the list of dishes' do
      expect(menu.dishes).to eq @dishes
    end
  end

  describe '#read_menu' do
    it 'outputs the menu' do
      expect { menu.read_menu }.to output(@dishes).to_stdout
    end
  end
end
