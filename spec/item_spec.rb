require 'item'

describe Item do
  
  context 'created from an array' do
 
    test_item = [1, 'Margarita', 9.0, 'Pizzas']
    let(:subject) { Item.new(test_item) }

    it 'should have an id' do
      expect(subject.id).to eq test_item[0]
    end

    it 'should have a name' do
      expect(subject.name).to eq test_item[1]
    end

    it 'should have a price' do
      expect(subject.price).to eq test_item[2]
    end

    it 'should have a category' do
      expect(subject.category).to eq test_item[3]
    end

  end

end
