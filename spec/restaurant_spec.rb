require 'restaurant'

describe Restaurant do

  subject(:restaurant) { described_class.new }


  describe '#menu' do
    context 'when requesting to see menu' do
      it 'should show menu' do
        expect(restaurant.steakhouse).to eq restaurant.steakhouse
      end
    end
  end

  describe '#order' do
    context 'when ordering from the menu' do
      it 'should add order to basket' do
        expect{ restaurant.order("Chicken") }.to change{ restaurant.basket.count }.by(1)
      end
    end
  end

  describe '#total' do
    context 'when checking total sum of dishes order' do
      it 'should return total' do
        expect(resturant.total).to eq total
      end
    end
  end

end
