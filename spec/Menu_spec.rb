require './lib/Menu'

describe Takeaway do

  describe 'Menu' do

    it 'food array works' do 
      expect(subject.food).to contain_exactly "beef", "chicken", "lamb"
    end

    it 'menu function works' do 
      expect(subject.menu).to contain_exactly ["beef", 12], ["chicken", 7], ["lamb", 10]
    end

    it 'can isolate a single food item from array' do 
      expect(subject.item_list(0)).to eq "chicken"
    end

  end


  describe 'pricing' do

    it 'price list works for individual items' do
      expect(subject.price_finder("chicken")).to eq 7
    end
  
  end


  describe 'ordering processes / basket' do

    it 'basket is an empty array when initialised' do 
      expect(subject.basket).to contain_exactly 
    end

    it 'create a user display to pick food items and move into an empty array (basket)' do 
      subject.order("beef")
      subject.order("chicken")
      subject.order("lamb")

      expect(subject.basket).to contain_exactly "beef", "chicken", "lamb"
    end

    it 'create an error message if user tries to input outside of the menu' do 

      expect{ subject.order("duck") }.to raise_error("not a valid input")
    end

    it 'create an error message if user tries to input outside of the menu' do 
      subject.order("beef")
      subject.order("chicken")
      subject.order("lamb")
      
      expect(subject.basket_cost).to eq 29
    end

  end
  
end
