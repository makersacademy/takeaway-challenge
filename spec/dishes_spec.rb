require 'dishes'

describe Dishes do
  describe '#prices' do
    it 'returns a Array' do
      expect(subject.prices).to be_an_instance_of(Array)
    end
  end
end
