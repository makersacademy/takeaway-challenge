require 'order'

describe Order do 
subject(:order) { Order.new }



  describe '#initialize' do 
    it 'defaults with an empty basket' do 
      expect(subject.basket).to be_empty
    end
  end





end
