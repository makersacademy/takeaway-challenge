require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'initialises the menu' do
    expect(menu).to respond_to(:dishes)
  end

  describe '#valid_item' do

      it 'provides a fail message if an item is unavailable' do
        msg = 'Item unavailable'
        expect{menu.valid_item('steak')}.to raise_error msg
      end

  end

  describe '#price' do

      it 'returns the price for an item off the menu' do
        expect(menu.price('pasta')).to eq 12.5
      end
  end

end
