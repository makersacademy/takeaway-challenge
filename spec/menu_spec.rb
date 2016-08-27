require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  describe '#show' do
      specify{expect{menu.show}.to output.to_stdout}
  end

  describe '#get_price' do
    it 'returns the price of a given item' do
      expect(menu.get_price("margherita")).to eq 6
    end
    it 'raises an error when an item is selected that is not on the menu' do
      msg='This item is not currently on our menu'
      expect{menu.get_price("seafood")}.to raise_error(msg)
    end
  end
end
