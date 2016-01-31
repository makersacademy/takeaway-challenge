require 'menu'

describe Menu do
  subject(:menu){ described_class.new}

  describe '#initialize' do
    it 'creates a new hash with dishes' do
      expect(menu.dishes.empty?).to be false
    end

    it 'cannot override the menu' do
      menu.dishes[:ham_hock] = 2
      expect(menu.dishes[:ham_hock]).not_to be 2
    end
  end

  describe '#show' do
    it 'prints out the menu' do
    expect(menu.show).to include(("name....................£price\n"))
    end
  end

end
