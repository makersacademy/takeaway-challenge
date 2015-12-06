require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do
    it 'can show a list of dishes with prices' do
      expect(menu.list).to eq(pizza: 6,
                              hamburger: 7,
                              curry: 5,
                              chips: 3,
                              cake: 4)
    end
  end
end
