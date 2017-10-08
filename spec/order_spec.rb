require 'order'

class FakeMenu

  attr_reader :dishes

  def initialize
    @dishes = { 'Pizza' => 8,
                'Pasta' => 6,
                'Salad' => 8,
                'Chips' => 3,
                'Burger'=> 9
              }
  end
end

describe Order do

  let(:order) { described_class.new(FakeMenu.new) }

  describe 'basket' do
    it 'should be initialised with an empty basket' do
      expect(order.basket).to be_empty
    end
    it 'customer should be able to add items to the basket' do
      order.add('Pasta', 1)
      expect(order.basket).to eq ['Pasta']
    end
    it 'raises an error if customer adds unknown food' do
      expect{ order.add('fish', 1) }.to raise_error 'This is not on the menu!'
    end
    it 'customer can add more than one of each dish' do
      order.add('Salad', 2)
      expect(order.basket).to eq ['Salad', 'Salad']
    end
  end

end
