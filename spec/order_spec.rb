require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }

  describe '#initialization' do
    it 'should create an empty selection array' do
      expect(order.basket).to eq []
    end
  end


  describe '#order' do
    it 'should respond to place_order' do
      expect(order).to respond_to(:order).with(2).arguments
    end

    it 'should add_dish selection to basket array' do
      order.order(dish, quantity)
      expect(order.basket).to include {{:dish => dish, :quantity => quantity}}
    end

  end

end
