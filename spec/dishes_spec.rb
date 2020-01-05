require 'dishes'

describe Dishes do
  describe '#initialize' do

    it 'sees a list of dishes' do
      expect(subject.list_of_dishes).to eq subject.list_of_dishes
    end
  end

end
