require 'order'
describe Order do
  let(:menu) { double :menu, find_dish: dish }
  let(:dish) { double :dish, price: 10, name: 'Rice-cakes' }
  let(:delivery) { double :delivery, dispatch: nil }
  let(:delivery_klass) { double :delivery_klass, new: delivery }
  subject(:order) do
    described_class.new(menu: menu, delivery_klass: delivery_klass)
  end

  before { order.add('Rice-cakes', 25) }
  describe '#add' do
    it 'adds a dish with its quantity to the current order' do
      expect(order.details).to include(dish: dish, quantity: 25)
    end

    it 'increases quantity when already in cart' do
      order.add('Rice-cakes', 25)
      expected_dish = { name: dish.name, quantity: 50, sub_total: 500 }
      expect(order.view).to include expected_dish
    end
  end

  describe '#remove' do
    it 'removes a dish with its quantity from the current order' do
      order.remove('Rice-cakes')
      expect(order.details).to be_empty
    end
  end

  describe '#view' do
    it 'shows returns the content of the order' do
      expected_dish = { name: dish.name, quantity: 25, sub_total: 250 }
      expect(order.view).to include expected_dish
    end
  end

  describe '#summary' do
    it 'shows an order summary' do
      summary_response = "Total: $#{dish.price * 25}.00"
      expect(order.summary).to eq summary_response
    end
  end

  describe '#complete' do
    it 'completes the order' do
      order.complete(250)
      expect(order.details).to be_empty
    end
    it 'it initaites a text message' do
      expect(delivery).to receive(:dispatch)
      order.complete(250)
    end
  end
end
