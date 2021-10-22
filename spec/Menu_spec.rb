require './lib/Menu'

describe Menu do

  describe 'item list' do

    it 'food array works' do 

      expect(subject.food).to contain_exactly "beef", "chicken", "lamb"
    end

    it 'can isolate a single food item from array' do 

      # expect(subject.food('chicken')).to .eq chicken
    end

  end

  describe 'price' do

    it 'price list works' do
      expect(subject.prices).to contain_exactly ["beef", 12], ["chicken", 7], ["lamb", 10]
    end

  end
  
end
