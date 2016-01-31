require 'menu'

  describe Menu do

    subject(:menu) { described_class.new }

    it 'is an instance of Menu class' do
      expect(menu).to be_a(Menu)
    end

    it 'holds a list of dishes and prices' do
      expect(menu).to respond_to(:dishes)
    end

    it 'can access the dishes from the menu' do
      expect(menu.dishes.keys).to include("Mixed Kebab")
    end

    it 'can access the prices from the menu' do
      expect(menu.dishes.values).to include(1)
    end
  end
