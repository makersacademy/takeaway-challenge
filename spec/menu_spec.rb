require 'menu'

describe Menu do
  subject(:thai) { described_class.new }

  describe '#print_menu' do
    
    it 'should show the dishes' do
      expect { thai.print_menu }.to output("Green Curry: £6\nMassaman Curry: £6\nPanang Curry: £6\nPad Thai: £7\nRice: £2\nPad Pak: £3\nSingha: £4\n").to_stdout
    end

  end
end
