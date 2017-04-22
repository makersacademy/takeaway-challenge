require 'takeaway'

describe Takeaway do
  subject(:t) { described_class.new }
  let(:food) { double(:food) }

    describe '#read_menu' do
      context do
        it 'returns Brains in menu' do
          expect(t.read_menu).to include 'Brains'
        end
      end
    end

    describe '#order' do
      it 'responds to order' do
        expect(t).to respond_to(:order).with(1).arguments
      end

      it 'stores an order' do
        expect(t.order(food)).to include t.food_item
      end

      it 'stores more than one item in a basket' do
        t.order(food)
        t.order(food)
        expect(t.basket).to include food
      end

    end
end
