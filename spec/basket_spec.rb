require './lib/basket.rb'

describe Basket do
  
  describe '#initializes' do
    it 'with a item list' do
      expect(subject.items).to be_an(Array)
    end
end

end