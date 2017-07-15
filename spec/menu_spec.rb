require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe 'initialization' do
    it 'has a list of dishes' do
      expect(menu.dishes.count).not_to be_zero
    end

    it 'has no dishes with zero price' do
      expect(menu.dishes.select { |_name, price| price == 0 }.count).to be_zero
    end
  end
end
