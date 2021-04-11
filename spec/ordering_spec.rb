require 'ordering.rb'
require 'menu.rb'

describe Ordering do
  it 'manages the order requests' do
    expect(subject.basket).to eq []
  end

  describe '#add' do
    it 'adds menu items with price to basket' do
      expect(subject.basket).to eq([{:item=>item, :price=>price}])
    end
  end
end
