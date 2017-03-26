require 'menu_list'

describe MenuList do

subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'initializes with a menu' do
      expect(menu.menu).to include ({:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6})
    end
  end
end
