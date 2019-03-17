require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  
  describe '#print' do
    it 'prints out menu items' do
      expect { menu.print }.to output("Chicken Korma: £6.75\nLamb Bhuna: £7.25\nBasmati Rice: £2.00\n").to_stdout
    end
  end
  
end
