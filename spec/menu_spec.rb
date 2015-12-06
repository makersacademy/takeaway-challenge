require 'menu'

describe Menu do

  let(:menu) { described_class.new}

  describe '#create' do
    it 'should allow new dishes to be added to the menu' do
      menu.create(:pie, 7.99)
      expect(menu.dishes).to include(pie: 7.99)
    end
  end

  describe '#remove' do
    it 'should remove old dishes from the menu' do
      menu.create(:pie, 7.99)
      menu.remove(:pie)
      expect(menu.dishes).not_to include(pie: 7.99)
    end
  end



end
