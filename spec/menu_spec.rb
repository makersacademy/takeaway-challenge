require 'menu'

describe Menu do

  let(:item) { double :item, name: "Pizza", price: 5.00 }
  let(:item2) { double :item, name: "Fries", price: 1.99 }

  describe '#new' do
    it 'Initialises with an empty array' do
      expect(subject.dishes).to be_empty
    end
  end

  describe 'add_item' do
    it 'Adds an Item to the menu' do
      subject.add_item(item)
      expect(subject.dishes).to include item
    end
  end

  describe '#print_menu' do
    it 'Should print a list of dishes with relevant prices' do
      subject.add_item(item)
      expect(subject.print_menu).to eq "Pizza £5.00"
    end
  end

  describe '#has_item?' do
    it 'Returns true if dishes does contain item' do
      subject.add_item(item)
      expect(subject.has_item?(item)).to eq true
    end
    it 'Returns false if dishes does not contain item' do
      subject.add_item(item)
      expect(subject.has_item?(item2)).to eq false
    end
  end
end
