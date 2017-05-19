require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#print_menu' do
    it 'should respond to the method' do
      expect(menu).to respond_to(:print_menu)
    end
    it 'prints out the method' do
      expect { menu.print_menu }.to output("MENU\npizza - £5.0\ncarbonara - £6.0\npasta - £8.0\n").to_stdout
    end
  end
end
