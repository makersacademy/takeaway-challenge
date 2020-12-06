require 'dish'

describe Dish do
  let(:dish) { Dish.new("Porridge", 1) }

  describe '#new' do
    it 'should respond to two arguments' do
      expect(described_class).to respond_to(:new).with(2).arguments
    end

    it 'should store name parameter in an instance variable' do
      expect(dish.name).to eq "Porridge"
    end

    it 'should store price parameter in an instance variable' do
      expect(dish.price).to eq 1
    end
  end
end
