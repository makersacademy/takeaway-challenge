require 'menu'

describe Menu do

  subject(:menu) { described_class.new }


  describe '#contents' do
    it '1. is a hash' do
      expect(menu.contents).to be_an(Hash)
    end

  end

  describe '#show_menu' do
    it '2. reveals a list of dishes with prices ' do
      expect(menu.show_menu).to eq(:beef => 11, :fish => 13, :dahl => 9, :rice => 6)
    end
  end
end
