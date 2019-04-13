require 'dishes'

describe Dishes do
  describe '#prices' do
    it 'returns a Hash' do
      expect(subject.prices).to be_an_instance_of(Hash)
    end
  end
end
