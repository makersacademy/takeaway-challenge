require 'dish'

describe Dish do
  subject(:dish) { Dish.new('Kung Pao Chicken', 10) }

  describe '#initialize' do
    it 'defaults dishes with a name' do
      expect(subject.dish).to eq 'Kung Pao Chicken'
    end
    it 'defaults dishes with a price' do
      expect(subject.price).to eq 10
    end
  end

end
