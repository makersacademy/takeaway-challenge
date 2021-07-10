require 'dish'

describe Dish do
  describe '#initialization' do
    context 'when initialized with incorrect number of arguements' do
      it { expect { Dish.new }.to raise_error(ArgumentError) }
    end

    context 'when initialized with correct number of arguements' do
      it { expect(Dish.new('str', 5)).to be_a(Dish) }
    end
  end
end
