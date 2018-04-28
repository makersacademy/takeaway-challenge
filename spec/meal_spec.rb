require 'meal'

describe Meal do
  let(:menu) { double :menu, dishes: [{ name: selection }] }
  let(:selection) { double :selection }
  subject { Meal.new(menu) }

  describe '#add_dish', :add do
    it 'Adds 1 dish to the meal array' do
      subject.add_dish(selection, 1)
      expect(subject.meal.length).to eq(1)
    end

    it 'Adds 2 of the same dish to the meal array' do
      subject.add_dish(selection, 2)
      expect(subject.meal.length).to eq(2)
    end
  end
end
