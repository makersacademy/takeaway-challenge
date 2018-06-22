require './lib/menu.rb'

describe Menu do
  TEST_CSV_PATH = './spec/test.csv'
  let(:menu) { stub_const('Menu::CSV_PATH', TEST_CSV_PATH); Menu.new }
  describe '#menu_array' do
    it 'should contain the menu as an array of arrays' do
      expect(menu.menu_array[0][0]).to eq 'test dish 1'
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
      it 'should return the selected menu item as an array' do
        expect(menu.select(2)).to eq ['test dish 2', '£2.02', nil]
      end
    end
    context 'when given a dish name' do
      it 'should return the selected menu item as an array' do
        expect(menu.select('test dish 2')).to eq ['test dish 2', '£2.02', nil]
      end
    end
  end
end
