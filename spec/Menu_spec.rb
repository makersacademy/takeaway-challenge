require './lib/Menu'

describe Menu do

  describe 'item list' do

    it 'food array works' do 

      expect(subject.food).to contain_exactly "beef", "chicken", "lamb"
    end

    it 'can isolate a single food item from array' do 

      expect(subject.item_list(0)).to eq "chicken"
    end

  end

  describe 'price' do

    it 'price list works' do
      expect(subject.price_finder("chicken")).to eq 7
    end

    it 'can isolate single item price from array' do
      expect(subject.prices).to contain_exactly ["beef", 12], ["chicken", 7], ["lamb", 10]
    end

  end
  
end
