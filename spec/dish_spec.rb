require './lib/dish'
describe Dish do
  let(:dish) { described_class.new('durain', 440) } 
  context 'Feature 1 - Dish has price and name' do
    describe '#name' do
      it { expect(dish).to respond_to(:name) }
      it { expect(dish.name).to eq('durain'.to_sym) }
    end
    describe '#price' do
      it { expect(dish).to respond_to(:price) }
      it { expect(dish.price).to eq(440) }
    end
  end
end
