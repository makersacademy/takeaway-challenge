require './docs/order'
describe Order do

  describe '#select' do

    it 'responsible for creating new dishes' do
      dishes_class = double(:dishes_class)
      dish = double(:dish)
      order = Order.new(dishes_class)
      allow(dishes_class).to receive(:new)
      order.select(dish)
    end

    it 'can respond to select with an argument' do
      expect(subject).to respond_to(:select).with(1).argument
    end

  end
end
