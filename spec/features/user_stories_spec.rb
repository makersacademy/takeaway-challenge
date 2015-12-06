describe 'User Stories' do

  let(:dish1) {Dish.new(name: :pizza, price: 1)}
  let(:dish2) {Dish.new(name: :chicken, price: 2)}
  let(:dish_list) {DishList.new(dish1, dish2)}
  let(:order_list) {OrderList.new(dish_list)}

  before(:example){allow(order_list.client.messages).to receive(:create)}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices



  describe '#price_list' do
    it 'gives a list with the price of each dish' do
      expect(order_list.price_list).to eq ({pizza: 1, chicken: 2})
    end
  end


  describe '#place_order' do

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes


    context 'when a selected dish is unavailable' do
      it 'raises an error' do
        expect{order_list.place_order(apple: 2)}.to raise_error "An ordered dish is unavailable"
      end
    end

    context 'when all selected dishes are available' do

      it 'does not raise an error' do
        expect{order_list.place_order(pizza: 1)}.not_to raise_error
      end
      # As a customer
      # So that I can verify that my order is correct
      # I would like to check that the total I have been given matches the sum of the various dishes in my order

      context 'when given total does not match sum of dishes in customer\'s order' do
        it 'raises an error' do
          expect{order_list.place_order(2,pizza: 1)}.to raise_error "Total does not match sum of dishes in order"

        end
      end

        context 'when given total does matches sum of dishes in customer\'s order' do
          it 'does not raise an error' do
            expect{order_list.place_order(1,pizza: 1)}.not_to raise_error

          end
        end
      end


    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    end
  end
