require 'Menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) {double :dish}

  describe '#initialize' do

    it '> should initialize with the menu items in an array' do
      expect(menu.view.clear).to eq ([])
    end

  end

  describe '#print' do

    it '> should duplicate menu items so that they can be accessed by outside' do
      expect(menu.view.clear).to eq([])
    end

  end

  describe '#add' do

    it '> should add items to the menu' do
      menu.add(dish)
      expect(menu.view).to include(dish)
    end

  end

end
