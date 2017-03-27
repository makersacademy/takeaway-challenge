require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:food) { double(:food) }
  let(:price) { double(:price) }

  let(:sample_order1) {[ "Lasagne", "Chicken" ]}
  let(:sample_order2) { ["Lasagne", "Lasagne"] }
  let(:dummy_menu) { [{food: "Lasagne", price: 10 }, {food: "Chicken", price: 5}] }

  describe '#view' do
    it 'has a non - empty menu' do
      expect(menu.view).not_to be_empty
    end

    it 'is a type of array' do
      expect(menu.view).to be_a(Array)
    end

  end

  describe '#order_cost' do
    it 'finds the price of each item and then adds to a cumulative sum' do
      allow(menu).to receive(:view) { dummy_menu }
      expect(menu.order_cost(sample_order1)).to eq(15)
    end

    it 'finds the price of each item and then adds to a cumulative sum' do
      allow(menu).to receive(:view) { dummy_menu }
      expect(menu.order_cost(sample_order2)).to eq(20)
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
