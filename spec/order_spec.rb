require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu) { double(:Menu) }
  let(:dish1) { double(:Dish, name: "Chicken", price: 1) }

  describe '#accept' do
    it 'accepts an order' do

    end

    describe '#add' do
      it 'adds a meal to the order' do
        expect{ order.add dish1 }.to change { order.summary }.to include dish1
      end
    end
  end
end
