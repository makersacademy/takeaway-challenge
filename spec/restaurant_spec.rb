require 'restaurant'

describe Restaurant do
  subject(:chelo) { Restaurant.new }
  let(:menu){ double :menu }

  describe '#initialize' do
    it 'should check to see if menu has been created' do
      expect(!!chelo.menu).to be(true)
    end
  end


  describe '#display_menu' do
    it 'should check to see if a menu is put to screen' do
      expect(chelo.display_menu).to include(chelo.menu)
    end
  end

end
