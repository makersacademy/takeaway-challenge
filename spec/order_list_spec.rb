require 'order_list'

describe OrderList do

  let(:pizza){double(:pizza, name: :pizza, price: 1)}
  let(:chicken){double(:chicken, name: :chicken, price: 2)}
  let(:dish_list){double(:dish_list, prices: {pizza: 1, chicken: 2}, dishes: [pizza, chicken])}
  subject(:order_list) {described_class.new(dish_list)}

  describe '#prices' do
    it 'gives prices for dish list' do
      expect(dish_list).to receive(:prices)
      order_list.prices
    end
  end

  describe '#place_order' do

    context 'a dish selected is unavailable' do
      it 'raises an error' do
        expect{order_list.place_order({apple: 2})}.to raise_error "An ordered dish is unavailable"
      end
    end

    context 'all dishes selected are available' do
      it 'does not raise an error' do
        expect{order_list.place_order({pizza: 1})}.not_to raise_error
      end

    end


  end


end
