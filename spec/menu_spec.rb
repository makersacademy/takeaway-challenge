require 'menu'

describe Menu do

  subject(:menu) { described_class.new }


    describe '#print' do
      it 'prints out the menu' do
        printed_menu = {'chicken'=>4.99, 'fish'=>3.99, 'veg'=>2.99}
        expect(menu.print).to eq(printed_menu)
      end
    end
end
