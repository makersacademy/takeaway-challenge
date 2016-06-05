require 'menu'

describe Menu do

  subject(:menu) { described_class.new }


    describe '#print' do
      it 'prints out the menu' do
        printed_menu = {'spring roll'=>0.99, 'char sui bun'=>3.99, 'pork dumpling'=>2.99}
        expect(menu.print).to eq(printed_menu)
      end
    end
end
