require 'menu_list'
require 'stringio'

describe MenuList do

subject(:menu) { described_class.new }


  describe '#initialize' do
    it 'initializes with a menu' do
      expect(menu.menu).to include ({:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6})
    end
  end

  describe '#print_menu' do
    xit 'displays menu' do
      output = StringIO.new
      expect { menu.print_menu }.to match_stdout( 'some string' )
    end
  end

  describe '#get_price' do
    it 'returns the price of an item' do
      expect(menu.get_price(5)).to eq 1.8
    end
  end

  describe '#get_title' do
    it 'returns the title of an item' do
      expect(menu.get_title(5)).to eq 'CHIPS'
    end
  end
end
