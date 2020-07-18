require './lib/basket.rb'

describe Basket do
  
  describe '#initializes' do
    it 'with an item list' do
      expect(subject.items).to be_an(Array)
    end
    it 'with a total' do
      expect(subject.total).to be_an(Integer)
    end
end

end