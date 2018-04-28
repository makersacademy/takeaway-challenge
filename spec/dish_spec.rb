describe Dish do

  describe '#initilize' do

    it 'defaults to an empty name' do
      expect(subject.name).to be_nil
    end

    it 'defaults to a empty description' do
      expect(subject.description).to be_nil
    end

    it 'defaults to a empty price' do
      expect(subject.price).to be_nil
    end

  end

end
