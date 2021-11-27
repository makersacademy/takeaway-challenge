require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#dishes' do

    it 'should print menu list with prices' do
      allow(menu).to receive(:print_menu).and_return(:print_menu)
      #expect(menu.print_menu).to eq(:print_menu)
    end
  end
end