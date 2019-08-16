require './docs/order'
describe Order do
  let(:dishes_class) { double(:dishes_class) }
  let(:dish) { double(:dish) }
  let(:dishes) { double(:dishes) }
  # let(:price) { double(:price)}
  describe '#select' do

    # xit 'responsible for creating new dishes' do
    #   allow(dishes_class).to receive(:new).and_return(dishes)
    #   allow(dishes).to receive(:price)
    #   order = Order.new(dishes_class)
    #   order.select(dish)
    # end

    it 'can respond to select with an argument' do
      expect(subject).to respond_to(:select).with(1).argument
    end

    it 'can add prices to total' do
      allow(dishes_class).to receive(:new).and_return(dishes)
      allow(dishes).to receive(:price).and_return(10)
      order = Order.new(dishes_class)
      order.select("chicken burger")
      expect(order.total).to eq(10)
    end
  end
end
