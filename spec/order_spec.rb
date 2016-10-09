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

    it 'returns an array of menu items' do
      expect(subject.menu).to be_an_instance_of Array
    end
  end

  describe '#add_item' do

    it 'responds to one to two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end

    before do
      subject.add_item(subject.menu[1].name, subject.menu[1].price)
    end

    it 'adds an item to the basket' do
      expect(subject.basket.count).to eq 1
    end

    it 'adds a quantity of one by default' do
      expect(subject.basket.last[:quantity]).to eq 1
    end

    it 'adds the quantity specified' do
      subject.add_item(subject.menu[2].name, subject.menu[2].price, 4)
      expect(subject.basket.last[:quantity]).to eq 4
    end
  end

  describe '#total' do

    before do
      subject.add_item(subject.menu[1].name, subject.menu[1].price)
      subject.add_item(subject.menu[3].name, subject.menu[3].price)
      subject.add_item(subject.menu[4].name, subject.menu[4].price)
      subject.add_item(subject.menu[7].name, subject.menu[7].price, 2)
      subject.add_item(subject.menu[8].name, subject.menu[8].price, 3)
      subject.add_item(subject.menu[10].name, subject.menu[10].price, 3)
      subject.add_item(subject.menu[12].name, subject.menu[12].price, 2)
    end

    it 'accurately calculates the total' do
      expect(subject.total).to eq 55.95
    end
  end
end
