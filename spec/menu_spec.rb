require 'menu'
require 'pp'

describe Menu do

  describe '#print' do
    it 'print the menu' do
      expect(subject.print).to eq(Menu::LIST_OF_DISHES)
    end
  end

  # describe '#select' do
  #   it 'selects items from the menu' do
  #
  #  end
  #end

end
