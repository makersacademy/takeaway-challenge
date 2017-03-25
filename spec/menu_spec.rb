require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:food) { double(:food) }
  let(:price) { double(:price) }

  describe '#view' do
    it 'has a non - empty menu' do
      expect(menu.view).not_to be_empty
    end

    it 'is a type of array' do
      expect(menu.view).to be_a(Array)
    end

  end

  describe '#menu_entry_maker' do

    before(:example) do
      @menu_entry = menu.menu_entry_maker(food, price)
    end

    it 'creates a hash with food key' do
      expect(@menu_entry).to have_key(:food)
    end

    it 'creates a hash with price key' do
      expect(@menu_entry).to have_key(:price)
    end

  end

  describe '#load_csv' do
    it 'menu loads something from csv file' do
      expect(menu.load_csv).not_to be_empty
    end
  end

  describe 'on_menu?'do
    before(:example) do
      dummy_menu = [{food: "Lasagne"},{food: "Chicken"}]
      allow(menu).to receive(:view) {dummy_menu}
    end

    it 'returns true if item is on menu' do
      expect(menu.on_menu?("Lasagne")).to eq(true)
    end

    it 'returns false if item is not on menu' do
      expect(menu.on_menu?("Cheese")).to eq(false)
    end
  end

end
