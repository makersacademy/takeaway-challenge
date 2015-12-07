require 'order_list'

describe OrderList do

  let(:pizza){double(:pizza, name: :pizza, price: 1)}
  let(:chicken){double(:chicken, name: :chicken, price: 2)}
  let(:dish_list){double(:dish_list, price_list: {pizza: 1, chicken: 2}, dishes: [pizza, chicken])}
  subject(:order_list) {described_class.new(dish_list)}
  before(:example){allow(order_list.client.messages).to receive(:create)}

  describe '#price_list' do
    it 'gives a list with the price of each dish' do
      expect(dish_list).to receive(:price_list)
      order_list.price_list
    end
  end

  describe '#place_order' do

    context 'a dish selected is unavailable' do
      it 'raises an error' do
        expect{order_list.place_order(apple: 2)}
          .to raise_error "An ordered dish is unavailable"
      end
    end

    context 'all dishes selected are available' do

      context 'when given total does not match sum of dishes in customer\'s order' do
        it 'raises an error' do
          expect{order_list.place_order({pizza: 1},2)}
            .to raise_error "Total does not match sum of dishes in order"
        end
      end

        context 'when given total does matches sum of dishes in customer\'s order' do
          it 'sends a text' do
            order_list.place_order({pizza: 1},1)
            expect(self).to receive(:send_text_message)
            send_text_message
          end
        end

    end


  end


end
