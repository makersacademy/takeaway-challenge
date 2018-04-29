require 'meal'

describe Meal do
  let(:menu) { double :menu, menu: [{ name: selection, price: 2 }] }
  let(:selection) { double :selection }
  subject { Meal.new(menu) }

  describe '#add_dish', :add do
    it 'Adds 1 dish to the meals array' do
      subject.add_dish(selection, 1)
      expect(subject.meals.length).to eq(1)
    end

    it 'Adds 2 of the same dish to the basket array' do
      subject.add_dish(selection, 2)
      expect(subject.meals.length).to eq(2)
    end
  end

  describe '#sum_of_basket', :total do
    it 'Sums the total cost of the meal' do
      subject.add_dish(selection, 2)
      expect(subject.sum_of_basket).to eq(4)
    end
  end

  describe '#basket', :basket do
    it 'Returns a pretty string of the current meals' do
      subject.add_dish(selection, 2)
      expect { subject.basket }.to output("2 lots of #{selection}\n").to_stdout
    end
  end

  describe '#remove_dish', :remove do
    it 'Removes 1 dish from the meals array' do
      subject.add_dish(selection, 8)
      subject.remove_dish(selection, 3)
      expect(subject.meals.length).to eq(5)
    end
  end
end
