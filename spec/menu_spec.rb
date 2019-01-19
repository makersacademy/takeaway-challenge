require 'menu'

describe Menu do

  let(:dish) { double :dish, name: "Pizza", price: 5.00 }
  let(:dish2) { double :dish, name: "Fries", price: 1.99 }

  describe '#new' do
    it 'Initialises with an empty array' do
      expect(subject.dishes).to be_empty
    end
  end

  describe 'add_dish' do
    it 'Adds a dish to the menu' do
      subject.add_dish(dish)
      expect(subject.dishes).to include dish
    end
  end

  describe '#print_menu' do
    it 'Should print a list of dishes with relevant prices' do
      subject.add_dish(dish)
      expect(subject.print_menu).to eq "Pizza £5.00"
    end
  end

  describe '#has_dish?' do
    it 'Returns true if dishes does contain dish' do
      subject.add_dish(dish)
      expect(subject.has_dish?(dish)).to eq true
    end
    it 'Returns false if dishes does not contain dish' do
      subject.add_dish(dish)
      expect(subject.has_dish?(dish2)).to eq false
    end
  end
end
