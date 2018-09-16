require 'dish_list'

describe DishList do
  let(:dish1) { double(:dish1) }
  #let(:list) { double(:list, new:dish1) }
  describe '#add' do
    it 'adds a Dish to the list' do
      allow(:dish1).to receive
      subject.add("Food", 8.95)
      expect(subject.dishes).to eq dish1
    end
  end
end
