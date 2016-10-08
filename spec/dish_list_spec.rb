require 'dish_list'

describe DishList do

  let(:dish) { double :dish }
  let(:dish_class) { double :dish_class, new: dish }
  let(:dish_data) { ["Fries", "2"] }
  let(:dish_data_hash) { {name: dish_data[0], price: dish_data[1]} }

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
end
