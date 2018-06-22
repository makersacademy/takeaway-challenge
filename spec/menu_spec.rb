require './lib/menu.rb'

describe Menu do
  TEST_CSV_PATH = './spec/test.csv'
  context 'when using test.csv' do
    let(:menu) { stub_const('Menu::DEFAULT_CSV_PATH', TEST_CSV_PATH); Menu.new }
    describe '#menu_array' do
      it 'should contain the menu as an array of hashes' do
        expect(menu.menu_array[0][:name]).to eq 'test dish 1'
      end
    end

    describe '#list_prices' do
      it 'should return a list of items and their prices' do
        expect(STDOUT).to receive(:print).with(/\s*\d+\. /).at_least(:twice)
        expect(STDOUT).to receive(:print).with(/test dish \d+\ +/).at_least(:twice)
        expect(STDOUT).to receive(:puts).with(/\s*£\d+\.\d+/).at_least(:twice)
        menu.list_prices
      end
    end

    describe '#select' do
      context 'when given a number' do
        it 'should return the selected menu item as a hash' do
          expect(menu.select(2)[:price]).to eq '£2.02'
        end
      end
    end
    # context 'when given a dish name' do
    #   it 'should return the selected menu item as an array' do
    #     expect(menu.select('test dish 2')).to eq ['test dish 2', '£2.02', nil]
    #   end
    # end
  end
end
