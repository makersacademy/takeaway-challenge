require 'dish_list'

describe DishList do

  let(:dish_data) { ["Fries", "2"] }
  let(:dish_data_hash) { {name: dish_data[0], price: dish_data[1]} }
  let(:dish) { double :dish, name: dish_data[0], price: dish_data[1] }
  let(:dish_class) { double :dish_class, new: dish }

  subject { described_class.new(dish_class) }

  describe 'initialization' do
    it 'has empty dish list' do
      expect(subject.dishes).to be_empty
    end
  end

  describe '#add_dish' do
    it 'creates a new dish' do
      expect(dish_class).to receive(:new).with(dish_data_hash).and_return dish
      subject.add_dish(dish_data)
    end

    it 'adds a created dish to the list' do
      expect(dish_class).to receive(:new).with(dish_data_hash).and_return dish
      subject.add_dish(dish_data)
      expect(subject.dishes).to include dish
    end
  end

  describe '#to_s' do
    it 'returns a string format of the dishes' do
      allow(dish_class).to receive(:new).with(dish_data_hash).and_return dish
      subject.add_dish(dish_data)
      expect(subject.to_s).to eq "1.  Fries                          2.00\n"
    end
  end
end
