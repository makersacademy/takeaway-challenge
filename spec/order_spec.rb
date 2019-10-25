require './docs/order'
describe Order do
  let(:dishes_class) { double(:dishes_class) }
  let(:dishes) { double(:dishes) }
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
      expect(order.total).to eq("£10")
    end
    it 'can output that it was added' do
      allow(dishes_class).to receive(:new).and_return(dishes)
      allow(dishes).to receive(:price).and_return(10)
      order = Order.new(dishes_class)
      order.select("chicken burger")
      expect(order.select("chicken burger")).to eq("chicken burger has been added to your order")
    end
  end
  describe '#order_summary' do
    it' can print the order summary with prices' do
      allow(dishes_class).to receive(:new).and_return(dishes)
      allow(dishes).to receive(:price).and_return(10)
      order = Order.new
      order.select("chicken burger")
      order.select("chicken burger")
      expect(order.order_summary).to eq("chicken burger = £10, chicken burger = £10")
    end
  end
  describe '#total' do
  end
end
