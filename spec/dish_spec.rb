require 'dish'

describe Dish do
  subject { Dish.new("Spaghetti Hoops", 0.99) }

  describe '#new' do
    context 'when initialized with 2 arguments' do
      it 'has a name' do
        expect(subject.name).to eq "Spaghetti Hoops"
      end

      it 'has a price' do
        expect(subject.price).to eq 0.99
      end
    end
  end
end
