require 'dish'

describe Dish do

  describe ' has ' do
    subject { Dish.new('Pepperoni Pizza', 11.5) }
    it 'a name' do
      expect(subject.name).to eq('Pepperoni Pizza')
    end

    it 'a price' do
      expect(subject.price).to eq 11.5
    end
  end
end
