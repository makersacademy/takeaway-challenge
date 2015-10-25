require 'menu'

describe Menu do

  subject(:menu) { described_class.new(:hotdog) }

  describe '#menu_list' do
    it 'menu selection has a name' do
      expect(menu.name).to eq :hotdog
    end

    it 'items have a price' do
      expect(menu.price).not_to be nil
    end
  end

end
