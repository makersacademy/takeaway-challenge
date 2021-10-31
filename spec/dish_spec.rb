require './lib/dish'

describe Dish do

  describe '#name' do
    it 'has a name attribute on initialization' do
      expect(subject.name).to eq("")
    end
  end

  describe '#price' do
    it 'has a price attribute on initialization' do
      expect(subject.price).to eq(0)
    end
  end
end
