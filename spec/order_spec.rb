require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) {double(:menu, print_menu: "MENU\npizza - £5.0\ncarbonara - £6.0\npasta - £8.0\n")}
  describe '#show menu' do
    it 'shows the whole menu'do
      expect { order.show_menu }.to output("MENU\npizza - £5.0\ncarbonara - £6.0\npasta - £8.0\n").to_stdout
    end
  end
end
