require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'initialize with no dishes listed'do
    expect(menu.dishes).to be_empty
  end

  describe '#add_item' do
    it 'can add dish to menu' do
      menu.add_item(:rice, 2.60)
      expect(menu.dishes).to include(rice: 2.60)
    end
  end

context 'populated menu' do
  before do
    menu.add_item(:rice, 2.60)
  end
  describe '#remove_item' do
    it 'should remove item from dishes' do
      menu.remove_item(:rice)
      expect(menu.dishes).not_to include(rics: 2.60)
    end
  end

  describe '#includes?' do
    it 'should return true if menu includes dish' do
      expect(menu.includes?(:rice)).to be true
    end

    it 'should return false if menu does not include dish' do
      expect(menu.includes?(:football)).to be false
    end
  end
end


end
