require 'order'
require 'menu'

describe Order do

  describe '#initialize' do

    it 'returns an Array for the basket' do
      expect(subject.basket).to be_an_instance_of Array
    end

    it 'returns an empty Array for the basket' do
      expect(subject.basket.count).to eq 0
    end

    it 'returns a Menu object' do
      expect(subject.menu).to be_an_instance_of Menu
    end

    it 'returns an array of menu items' do
      expect(subject.menu.list).to be_an_instance_of Array
    end


  end

  describe '#add_item' do

    it 'responds to one to two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end

    before do
      subject.add_item("Chicken Teriyaki")
    end

    it 'adds an item to the basket' do
      expect(subject.basket.count).to eq 1
    end

    it 'adds a quantity of one by default' do
      expect(subject.basket.last[:quantity]).to eq 1
    end

    it 'adds the quantity specified' do
      subject.add_item("Tuna Sashimi", 4)
      expect(subject.basket.last[:quantity]).to eq 4
    end

  end
end
