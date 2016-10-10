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

    it 'sets total to 0 by default' do
      expect(subject.total).to eq 0
    end

    it 'sets confirmation status as false by default' do
      expect(subject).not_to be_confirmed
    end

  end

  describe '#add_item' do

    before do
      subject.add_item("Salmon Teriyaki")
    end

    it 'adds an item to the basket' do
      expect(subject.basket.count).to eq 1
    end

    it 'adds a quantity of one by default' do
      expect(subject.basket.last[:quantity]).to eq 1
    end

    it 'adds the quantity specified' do
      subject.add_item("Chicken Karaage", 4)
      expect(subject.basket.last[:quantity]).to eq 4
    end

    it "won't allow an item that's not on the menu" do
      expect{subject.add_item("Salmon Teriyakeey")}.to raise_error "Item on not on the menu"
    end
  end

  describe '#total' do

    before do
      subject.add_item("Salmon Teriyaki")
      subject.add_item("Pork Karaage")
      subject.add_item("Chicken Katsu Curry")
      subject.add_item("Tuna Sashimi", 2)
      subject.add_item("Cucumber Maki", 3)
      subject.add_item("Boiled Rice", 3)
      subject.add_item("Hot Sake", 2)
    end

    it 'accurately calculates the total' do
      expect(subject.total).to eq 55.95
    end
  end

  describe '#confirm' do

    it 'sets confirmation status to true' do
      subject.confirm
      expect(subject).to be_confirmed
    end

  end

end
