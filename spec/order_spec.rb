require 'order'

describe Order do

  subject(:order) {described_class.new}


  a = {:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6}
  b = {:title => 'PLAICE', :type => :main, :food => :fish,:price =>	5.6}
  c = {:title => 'HADDOCK', :type => :main,	:food => :fish,:price => 5.6}


  it { is_expected.to respond_to(:basket) }


  describe '#add_to_basket' do
    it 'adds a food to the basket' do
      order.add_to_basket(({:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6}))
      expect(order.basket).to include ({:title => 'ROCK', :type => :main, :food => :fish, :price => 5.6})
    end
  end

  describe 'return_foods' do
    xit 'provides a list of foods & price currently in the basket' do
      order.basket << a
      order.basket << b
      expect(order.return_foods).to include "You have ordered PLAICE at 5.6"
    end
  end

end
