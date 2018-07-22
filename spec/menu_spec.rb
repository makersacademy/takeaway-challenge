# "test" is used as the test instance, for easy understanding
require 'menu'

describe Menu do
  subject(:menu) { described_class.new(stuff) }

  let(:stuff) do
    { 
      thing1: 3.00,
      thing2: 5.00
    }
  end
  
  context 'menu' do
    it 'has a list of items with prices' do
      expect(subject.whiskies).to eq(stuff)
    end

    it 'shows a list of items with prices' do
      displayed_menu = "Thing1 £3.00, Thing2 £5.00"
      expect(subject.show).to eq(displayed_menu)
    end

    it 'confirms that an item is on menu' do
      expect(menu.has_item?(:thing1)).to be true
    end

    it 'warns that an item is not on menu' do
      expect(menu.has_item?(:trash)).to be false
    end
  end
end
