require './docs/order'
describe Order do
  describe '#select' do
    xit 'can respond to select with an argument' do
      expect(subject).to respond_to(:select).with(1).argument
    end
    it 'responsible for creating new dishes' do
      dishes_class = double(:dishes_class)
      order = Order.new(dishes_class)
      allow(dishes_class).to receive(:new)
      order.select
    end
  end
end
