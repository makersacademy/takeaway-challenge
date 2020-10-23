require 'dishes'

describe ListOfDishes do

  describe '#new' do
    it 'makes a hashes of dishes' do
      expect(subject.read_dishes).not_to be nil
    end

    it 'makes a hashes with the list of names of dishes' do
      expect(subject.read_dishes).to include("rice")
    end

    it 'makes a hashes with the list of prices of the dishes' do
      expect(subject.read_dishes).to include("rice" => 1)
    end
  end

  describe '#print' do
    it 'prints a list of all available dishes and their costs, one per line' do
      expect(subject.print).to include("£")
    end
  end
end
