require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#display' do
    it 'lists out the dish_list' do
      expect(menu.display).not_to be_empty
    end
  end
end
