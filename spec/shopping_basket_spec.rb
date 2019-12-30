require 'shopping_basket'

describe ShoppingBasket do 

  describe 'initialization' do 
    it 'should init with empty array' do 
      expect(subject.basket).to eq([])
    end 
  end 

  describe '#add_item' do 

    it 'should respond to add_item' do 
      expect(subject).to respond_to(:add_item).with(1).arguments 
    end 

    it 'should add an item to basket array' do 
      item = double :item 
      expect(subject.add_item(item)).to include(item)
    end 

    it 'should change the length of the basket array' do 
      item = double :item 
      subject.add_item(item)
      subject.add_item(item)
      expect(subject.basket.length).to eq 2
    end 

  end   
end 