require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show' do
    it 'prints the menu' do
      expect { menu.show }.to output(include('Drink: £3.50')).to_stdout
    end
  end
end
