require 'menu'

describe Menu do

  subject(:menu) { described_class.new }


    describe '#print' do
      it 'prints out the menu' do
        printed_menu = {'chicken'=>4.50, 'fish'=>5.00, 'veg'=>6.50}
        expect(menu.print).to eq(printed_menu)
      end
    end
end
