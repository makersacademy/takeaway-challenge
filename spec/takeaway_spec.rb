require 'takeaway'

describe ListOfDishes do

  describe '#new' do
    it 'makes a array of hashes of dishes' do
      expect(subject.read_dishes).not_to be nil
    end
  end

  describe '#new' do
    it 'makes a array of hashes with the list of names of dishes' do
      expect { subject.read_dishes.to include(:name) }
    end
  end

  describe '#new' do
    it 'makes a array of hashes with the list of prices of the dishes' do
      expect { subject.read_dishes.to include(:cost) }
    end
  end

end
