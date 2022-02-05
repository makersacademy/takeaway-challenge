require './lib/takeaway.rb'

describe Restaurant do
  describe '#list' do
    it 'lists dishes with prices' do
      restaurant = Restaurant.new
      expect(subject).to respond_to(:list)
    end
  
    it 'stores a list of dishes with prices' do
        expect(subject.dishes_with_prices).to be_empty
    end
  end

end


