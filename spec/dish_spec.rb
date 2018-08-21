require 'dish'

describe Dish do 
  subject(:dish) { Dish.new('Pie', 3) } # subject { described_class.new('Pie', 3) }
  let(:mockDish) { Dish.new('Mash', 2) }

  describe '#initialize' do 
    it 'defaults dishes with a name' do 
      expect(subject.name).to eq 'Pie'
    end
    it 'defaults dishes with a price' do 
      expect(subject.price).to eq 3
    end
  end
  
end
