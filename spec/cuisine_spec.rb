require 'cuisine'

describe Cuisine do
  subject(:cuisine) {described_class.new(chinese.string, dish_klass)}
  let(:chinese) {double :chinese, string: 'chinese'}
  let(:dish_klass) {double :dish_klass, new: dish}
  let(:dish) {double :dish, name: :chow_mein, price: 3.99}
  before do

  end

  context '#initialize' do
    it 'has an empty array of dishes' do
      expect(cuisine.dishes).to be_empty
    end
  end

  context 'creating the dishes' do
    describe '#create_dishes' do
      it 'instantiates the required dishes' do
        expect(dish_klass).to receive(:new)
        cuisine.create_dishes
      end

      it 'pushes the new dish to the dishes array' do
        cuisine.create_dishes
        expect(cuisine.dishes).not_to be_empty
      end
    end
  end
end
